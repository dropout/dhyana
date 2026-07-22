import 'dart:typed_data';
import 'dart:math' as math;

import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/service/safe_image_detector.dart';
import 'package:dhyana/widget/input/profile_image_picker/profile_image_picker_current_image.dart';
import 'package:dhyana/widget/input/profile_image_picker/profile_image_picker_edit_badge.dart';
import 'package:dhyana/widget/input/profile_image_picker/profile_image_selection_controller.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/profile_image_placeholder.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> _pickProfileImageFromGallery() {
  return ImagePicker().pickImage(source: ImageSource.gallery);
}

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
  final PickProfileImage pickImage;

  FormBuilderProfileImagePicker({
    required this.profile,
    required this.label,
    this.onError,
    this.pickImage = _pickProfileImageFromGallery,
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
             imageData: field.value,
             onImageSelected: (value) {
               field.didChange(value);
             },
             onError: widget.onError,
             pickImage: widget.pickImage,
           );
         },
       );

  @override
  FormBuilderImagePickerState createState() => FormBuilderImagePickerState();
}

class FormBuilderImagePickerState
    extends FormBuilderFieldState<FormBuilderProfileImagePicker, Uint8List> {}

enum ProfileImagePickerProcessState { idle, pickingImage }

class ProfileImagePicker extends StatefulWidget {
  final String label;
  final Profile profile;
  final Uint8List? imageData;

  final void Function(Uint8List)? onImageSelected;
  final void Function(ProfileImagePickerError, dynamic)? onError;
  final PickProfileImage pickImage;

  const ProfileImagePicker({
    required this.profile,
    required this.label,
    this.imageData,
    this.onImageSelected,
    this.onError,
    this.pickImage = _pickProfileImageFromGallery,
    super.key,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  /// The size of the edit indicator that appears on the profile image picker.
  static const double _indicatorSize = 32.0;

  /// Loading state for the resources needed for image safety detection.
  LoadingState _nsfwDetectorLoadingState = .loading;

  /// The current processing state of the profile image picker.
  ProfileImagePickerProcessState _processingState =
      ProfileImagePickerProcessState.idle;

  late final SafeImageDetector _safeImageDetectorService;
  late ProfileImageSelectionController _imageSelectionController;

  @override
  void initState() {
    super.initState();
    _initializeResources();
  }

  /// Initializes the resources needed for image safety detection.
  /// Don't add this to services singleton it consumes a lot of memory and is 
  /// only needed for this widget.
  void _initializeResources() async {
    final crashlyticsService = context.services.crashlyticsService;

    try {
      _safeImageDetectorService =
          await context.services.safeImageDetectorFactory.create();
      _initializeController();

      if (mounted) {
        setState(() {
          _nsfwDetectorLoadingState = LoadingState.loaded;
        });
      } else {
        _safeImageDetectorService.releaseModel();
      }
    } catch (error, stackTrace) {
      crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Failed to initialize safe image detector',
      );
      if (mounted) {
        setState(() {
          _nsfwDetectorLoadingState = LoadingState.error;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant ProfileImagePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.pickImage != widget.pickImage) {
      _initializeController();
    }
  }

  void _initializeController() {
    _imageSelectionController = ProfileImageSelectionController(
      pickImage: widget.pickImage,
      safeImageDetectorService: _safeImageDetectorService,
    );
  }

  void _onWidgetTapped(BuildContext context) {
    if (_processingState == ProfileImagePickerProcessState.pickingImage) {
      return;
    }

    _selectFile();
    context.hapticsTap();
  }

  void _selectFile() async {
    setState(() {
      _processingState = ProfileImagePickerProcessState.pickingImage;
    });

    final result = await _imageSelectionController.selectProfileImage();

    if (!mounted) {
      return;
    }

    setState(() {
      _processingState = ProfileImagePickerProcessState.idle;
    });

    if (result.imageData != null) {
      widget.onImageSelected?.call(result.imageData!);
    }

    if (result.error != null) {
      widget.onError?.call(result.error!, result.details);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Handle the loading state of the NSFW detector
    switch (_nsfwDetectorLoadingState) {
      case LoadingState.loading:
        return buildLoading(context);
      case LoadingState.loaded:
        return buildLoaded(context);
      case LoadingState.error:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();      
    }
  }

  Widget buildLoading(BuildContext context) {
    return SizedBox(
      width: DesignSpec.circleLg,
      height: DesignSpec.circleLg,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildLoaded(BuildContext context) {
    final Offset indicatorPos = _computeEditBadgePosition(45.0);
    return GestureDetector(
      onTap: () => _onWidgetTapped(context),
      child: SizedBox(
        width: DesignSpec.circleLg,
        height: DesignSpec.circleLg,
        child: Stack(
          children: [
            _buildCurrentImage(),

            // show a loading indicator when picking an image
            // this makes sense when cold starting,
            // because it may take a while on some devices
            if (_processingState == ProfileImagePickerProcessState.pickingImage)
              SizedBox.expand(
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  color: AppColors.backgroundPaperLight,
                ),
              ),

            // show edit indicator
            Positioned(
              left: indicatorPos.dx,
              top: indicatorPos.dy,
              child: ProfileImagePickerEditBadge(indicatorSize: _indicatorSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentImage() {
    if (widget.imageData != null) {
      return ProfileImagePickerCurrentImage(
        imageProvider: MemoryImage(widget.imageData!),
      );
    }

    return SizedBox.expand(
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 4.0),
        ),
        child: widget.profile.hasProfileImage
            ? ProfileImage(profile: widget.profile, size: DesignSpec.circleLg)
            : ProfileImagePlaceholder(
                name: widget.profile.displayName,
                backgroundColor: Colors.grey,
              ),
      ),
    );
  }

  /// Computes the position of the edit indicator based on the given angle in degrees.
  /// The indicator is positioned on the circumference of the profile image circle.
  Offset _computeEditBadgePosition(double angleDegrees) {
    final double radius =
        DesignSpec.circleLg / 2 - 6.0; // minus the border width
    final double angleRadians = angleDegrees * math.pi / 180.0;
    final double center = DesignSpec.circleLg / 2;
    final double left =
        center + radius * math.cos(angleRadians) - _indicatorSize / 2;
    final double top =
        center + radius * math.sin(angleRadians) - _indicatorSize / 2;
    return Offset(left, top);
  }

  @override
  void dispose() {
    if (_nsfwDetectorLoadingState == LoadingState.loaded) {
      _safeImageDetectorService.releaseModel();
    }
    super.dispose();
  }

}
