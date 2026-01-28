import 'dart:math' as math;

import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:dhyana/service/all.dart';

/// A FormBuilder field that allows users to pick an image for their profile
/// from their device.
/// It displays the selected profile's image.
/// It uses the [ProfileImagePicker] widget internally to
/// handle the image selection.
class FormBuilderProfileImagePicker extends FormBuilderField<Uint8List> {

  /// The profile associated with the image picker.
  final Profile profile;

  /// The label for the image picker.
  final String label;

  final void Function(ProfileImagePickerError, dynamic)? onError;

  FormBuilderProfileImagePicker({
    required this.profile,
    this.label = 'Profile Image',
    this.onError,
    // From Super
    required super.name,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled,
    super.initialValue,
    super.focusNode,
    super.onSaved,
    super.validator,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.key,
  }) : super(
    builder: (FormFieldState<Uint8List?> field) {
      final state = field as FormBuilderImagePickerState;
      final widget = state.widget;

      return ProfileImagePicker(
        profile: widget.profile,
        label: widget.label,
        onImageSelected: (value) {
          field.didChange(value);
        },
        onError: widget.onError,
      );
    },
  );

  @override
  FormBuilderImagePickerState createState() => FormBuilderImagePickerState();
}

class FormBuilderImagePickerState
  extends FormBuilderFieldState<FormBuilderProfileImagePicker, Uint8List> {}


enum ProfileImagePickerError {
  photoAccessDenied,
  imageLoadingFailed,
  notSafeImage,
  unknown,
}

enum ProfileImagePickerProcessState {
  idle,
  pickingImage,
}

class ProfileImagePicker extends StatefulWidget {

  final String label;
  final Profile profile;

  final void Function(Uint8List)? onImageSelected;
  final void Function(ProfileImagePickerError, dynamic)? onError;

  const ProfileImagePicker({
    required this.profile,
    this.onImageSelected,
    this.onError,
    this.label = 'Profile Image',
    super.key,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {

  static const double _indicatorSize = 32.0;

  ProfileImagePickerProcessState _processingState =
    ProfileImagePickerProcessState.idle;

  final ImagePicker picker = ImagePicker();
  Uint8List? selectedImageData;

  // New fields to manage network image loading/listening
  ImageProvider? _imageProvider;
  ImageStream? _networkImageStream;
  ImageStreamListener? _networkImageListener;
  bool _initialImageLoaded = false;
  String? _currentImageUrl;

  bool get hasSelectedImage =>
    selectedImageData != null;

  @override
  void initState() {
    // start resolving after first frame to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateNetworkImageListenerIfNeeded();
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // ensure stream is (re)resolved if needed when dependencies change
    _updateNetworkImageListenerIfNeeded();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ProfileImagePicker oldWidget) {
    if (oldWidget.profile.photoUrl != widget.profile.photoUrl) {
      _updateNetworkImageListenerIfNeeded();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _updateNetworkImageListenerIfNeeded() {
    final String newUrl = widget.profile.photoUrl;
    if (newUrl.isEmpty) {
      _removeNetworkImageListener();
      _currentImageUrl = null;
      _initialImageLoaded = false;
      return;
    }

    if (_currentImageUrl == newUrl && _networkImageStream != null) {
      // already resolving the same url
      return;
    }

    // Remove old listener if any
    _removeNetworkImageListener();

    _currentImageUrl = newUrl;
    final provider = NetworkImage(newUrl);
    final ImageConfiguration config = createLocalImageConfiguration(context);
    final ImageStream stream = provider.resolve(config);

    _initialImageLoaded = false;

    _networkImageListener = ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        if (!mounted) return;
        setState(() {
          _initialImageLoaded = true;
        });
      },
      onError: (dynamic error, StackTrace? stackTrace) {
        if (!mounted) return;
        setState(() {
          _initialImageLoaded = false;
        });
      },
    );

    stream.addListener(_networkImageListener!);
    _networkImageStream = stream;
    _imageProvider = provider;
  }

  void _removeNetworkImageListener() {
    if (_networkImageStream != null && _networkImageListener != null) {
      try {
        _networkImageStream!.removeListener(_networkImageListener!);
      } catch (_) {
        // ignore if already removed
      }
    }
    _networkImageStream = null;
    _networkImageListener = null;
  }

  @override
  void dispose() {
    _removeNetworkImageListener();
    super.dispose();
  }

  void _onWidgetTapped(BuildContext context) {
    _selectFile(context);
    context.hapticsTap();
  }

  void _selectFile(BuildContext context) async {
    try {

      // Start picking image
      setState(() {
        _processingState = ProfileImagePickerProcessState.pickingImage;
      });
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      // No image selected, return to idle state
      if (pickedFile == null) {
        setState(() {
          _processingState = ProfileImagePickerProcessState.idle;
        });
        return;
      }

      // Detect NSFW content
      final safeImageDetector = await DefaultSafeImageDetector.load();
      img.Image? image = img.decodeImage(await pickedFile.readAsBytes());
      if (image == null) {
        setState(() {
          _processingState = ProfileImagePickerProcessState.idle;
        });
        return;
      } else {
        image = img.copyResizeCropSquare(image, size: 224);
      }

      final detectionResult = await safeImageDetector.detectImageSafety(image);
      if (!detectionResult.isSafe) {
        setState(() {
          _processingState = ProfileImagePickerProcessState.idle;
        });
        widget.onError?.call(ProfileImagePickerError.notSafeImage, null);
        return;
      }

      Uint8List? imageData = img.encodeJpg(image, quality: 90);
      setState(() {
        selectedImageData = imageData;
        _processingState = ProfileImagePickerProcessState.idle;
      });
      widget.onImageSelected?.call(selectedImageData!);
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        widget.onError?.call(ProfileImagePickerError.photoAccessDenied, e);
      } else {
        widget.onError?.call(ProfileImagePickerError.unknown, e);
      }
    } catch (e) {
      widget.onError?.call(ProfileImagePickerError.unknown, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCurrentImageDisplay(context),
      ],
    );
  }

  Widget buildCurrentImageDisplay(BuildContext context) {
    ImageProvider imageProvider = _getImageProvider();
    final Offset indicatorPos = _computeIndicatorPosition(45.0);
    return GestureDetector(
      onTap: () => _onWidgetTapped(context),
      child: SizedBox(
        width: DesignSpec.circleLg,
        height: DesignSpec.circleLg,
        child: Stack(
          children: [
            // Use DecorationImage so the ImageProvider is painted inside the circle
            AnimatedSwitcher(
              duration: Durations.medium2,
              child: DecoratedBox(
                key: ValueKey<ImageProvider>(imageProvider),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 4.0,
                  ),
                  color: Colors.grey.shade400,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                // ClipOval ensures child content (if any) matches the circular shape
                child: SizedBox.expand(),
              ),
            ),
            // show edit indicator
            Positioned(
              left: indicatorPos.dx,
              top: indicatorPos.dy,
              child: buildEditIndicator(context),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImageProvider() {
    if (hasSelectedImage) {
      return MemoryImage(selectedImageData!);
    } else if (_imageProvider != null && _initialImageLoaded) {
      return NetworkImage(widget.profile.photoUrl);
    } else {
      return BlurHashImage(widget.profile.photoBlurhash);
    }
  }

  Widget buildEditIndicator(BuildContext context) {
    return Container(
      width: _indicatorSize,
      height: _indicatorSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        ),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(
        Icons.edit,
        color: Colors.black,
        size: 16,
      ),
    );
  }

  Offset _computeIndicatorPosition(double angleDegrees) {
    final double radius = DesignSpec.circleLg / 2 - 10.0; // minus the border width
    final double angleRadians = angleDegrees * math.pi / 180.0;
    final double center = DesignSpec.circleLg / 2;
    final double left = center + radius * math.cos(angleRadians) - _indicatorSize / 2;
    final double top = center + radius * math.sin(angleRadians) - _indicatorSize / 2;
    return Offset(left, top);
  }

}
