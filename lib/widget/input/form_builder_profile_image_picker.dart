import 'dart:math' as math;

import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

/// A FormBuilder field that allows users to pick an image from their device.
/// It displays the selected image when its url is provided,
/// and will return the selected image data as Uint8List.
class FormBuilderProfileImagePicker extends FormBuilderField<Uint8List> {

  final Profile profile;
  final String label;

  FormBuilderProfileImagePicker({
    required this.profile,
    this.label = 'Profile Image',
    // From Super
    required super.name,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
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
        }
      );
    },
  );

  @override
  FormBuilderImagePickerState createState() => FormBuilderImagePickerState();
}

class FormBuilderImagePickerState
  extends FormBuilderFieldState<FormBuilderProfileImagePicker, Uint8List> {}

class ProfileImagePicker extends StatefulWidget {

  final String label;
  final Profile profile;

  final void Function(Uint8List)? onImageSelected;

  const ProfileImagePicker({
    required this.profile,
    this.onImageSelected,
    this.label = 'Profile Image',
    super.key,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {

  static const double _indicatorSize = 32.0;

  ImagePicker picker = ImagePicker();
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
    super.didChangeDependencies();
    // ensure stream is (re)resolved if needed when dependencies change
    _updateNetworkImageListenerIfNeeded();
  }

  @override
  void didUpdateWidget(covariant ProfileImagePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile.photoUrl != widget.profile.photoUrl) {
      _updateNetworkImageListenerIfNeeded();
    }
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
    final crashlyticsService = context.services.crashlyticsService;

    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      Uint8List data = await pickedFile.readAsBytes();
      img.Command imageCommand = img.Command();
      imageCommand.decodeImage(data);
      imageCommand.copyResizeCropSquare(
        size: 128,
      );
      imageCommand.encodeJpg(quality: 90);

      Uint8List? imageData = await imageCommand.getBytes();
      setState(() {
        selectedImageData = imageData;
      });
      widget.onImageSelected?.call(selectedImageData!);
    } on PlatformException catch (e, stack) {
      if (context.mounted) {
        if (e.code == 'photo_access_denied') {
          showDialog(context: context, builder: (BuildContext ctx) {
            return buildPhotoAccessDialog(ctx);
          });
        }
      }
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'PlatformException in ImagePickerWidget::_selectFile',
      );
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unknown error occurred while trying to pick an image',
      );
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

  Widget buildPhotoAccessDialog(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).photoAccessDialogTitle),
      content: Text(AppLocalizations.of(context).photoAccessDialogText
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(AppLocalizations.of(context).photoAccessDialogButtonText.toUpperCase()),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget buildCurrentImageDisplay(BuildContext context) {
    ImageProvider imageProvider = _getImageProvider();
    final Offset indicatorPos = _computeIndicatorPosition(45.0);
    return GestureDetector(
      onTap: () => _onWidgetTapped(context),
      child: SizedBox(
        width: AppThemeData.circleLg,
        height: AppThemeData.circleLg,
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
    final double radius = AppThemeData.circleLg / 2 - 10.0; // minus the border width
    final double angleRadians = angleDegrees * math.pi / 180.0;
    final double center = AppThemeData.circleLg / 2;
    final double left = center + radius * math.cos(angleRadians) - _indicatorSize / 2;
    final double top = center + radius * math.sin(angleRadians) - _indicatorSize / 2;
    return Offset(left, top);
  }

}
