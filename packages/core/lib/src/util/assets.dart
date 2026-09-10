/// This file contains all the assets used in the app.
/// Assets should be not referenced directly in the code with inline strings, 
/// but instead should be referenced through this class.
class Assets {

  // Images
  static const String avatarPlaceholder =
    'packages/assets/images/avatar_placeholder.png';
  static const String appleLogo = 
    'packages/assets/images/apple_logo.png';
  static const String googleLogo = 
    'packages/assets/images/google_logo.png';

  // Sounds
  static const String noSoundResourceUrl =
    'asset:///packages/assets/audio/silent_meditation.mp3';

  // Shaders
  static const String shaderGradientFlow =
    'packages/assets/shaders/gradient_flow.frag';
  static const String shaderLinearGradientMask =
    'packages/assets/shaders/linear_gradient_mask.frag';
    
  // ML Models
  static const String nswfModel = 
    'packages/assets/gantman_nswf_110.tflite';
}
