import 'package:dhyana/service/safe_image_detector.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

typedef PickProfileImage = Future<XFile?> Function();

enum ProfileImagePickerError {
  photoAccessDenied,
  imageLoadingFailed,
  notSafeImage,
  unknown,
}

class ProfileImageSelectionController {
  final PickProfileImage pickImage;
  final SafeImageDetector safeImageDetectorService;

  const ProfileImageSelectionController({
    required this.pickImage,
    required this.safeImageDetectorService,
  });

  Future<ProfileImageSelectionResult> selectProfileImage() async {
    try {
      final XFile? pickedFile = await pickImage();
      if (pickedFile == null) {
        return const ProfileImageSelectionResult.cancelled();
      }

      final img.Image? decodedImage;
      try {
        decodedImage = img.decodeImage(await pickedFile.readAsBytes());
      } catch (error) {
        return ProfileImageSelectionResult.error(
          ProfileImagePickerError.imageLoadingFailed,
          error,
        );
      }

      if (decodedImage == null) {
        return const ProfileImageSelectionResult.error(
          ProfileImagePickerError.imageLoadingFailed,
        );
      }

      final processedImage = img.copyResizeCropSquare(decodedImage, size: 224);
      final detectionResult = await safeImageDetectorService.detectImageSafety(
        processedImage,
      );

      if (!detectionResult.isSafe) {
        return const ProfileImageSelectionResult.error(
          ProfileImagePickerError.notSafeImage,
        );
      }

      final imageData = Uint8List.fromList(
        img.encodeJpg(processedImage, quality: 90),
      );

      return ProfileImageSelectionResult.success(imageData);
    } on PlatformException catch (error) {
      return ProfileImageSelectionResult.error(
        error.code == 'photo_access_denied'
            ? ProfileImagePickerError.photoAccessDenied
            : ProfileImagePickerError.unknown,
        error,
      );
    } catch (error) {
      return ProfileImageSelectionResult.error(
        ProfileImagePickerError.unknown,
        error,
      );
    }
  }
}

class ProfileImageSelectionResult {
  final Uint8List? imageData;
  final ProfileImagePickerError? error;
  final Object? details;
  final bool isCancelled;

  const ProfileImageSelectionResult.success(this.imageData)
    : error = null,
      details = null,
      isCancelled = false;

  const ProfileImageSelectionResult.error(this.error, [this.details])
    : imageData = null,
      isCancelled = false;

  const ProfileImageSelectionResult.cancelled()
    : imageData = null,
      error = null,
      details = null,
      isCancelled = true;
}
