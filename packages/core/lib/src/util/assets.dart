/// This file contains all the assets used in the app.
/// Assets should be not referenced directly in the code with inline strings, 
/// but instead should be referenced through this class.
class Assets {

  // Images
  static const String avatarPlaceholder =
    'packages/core/assets/images/avatar_placeholder.png';
  static const String appleLogo = 'packages/core/assets/images/apple_logo.png';
  static const String googleLogo = 'packages/core/assets/images/google_logo.png';

  // Sounds
  static const String noSoundResourceUrl =
    'asset:///packages/core/assets/audio/silent_meditation.mp3';

  // Shaders
  static const String shaderGradientFlow =
    // 'shaders/gradient_flow.frag';
    'packages/core/shaders/gradient_flow.frag';
  static const String shaderLinearGradientMask =
    // 'shaders/linear_gradient_mask.frag';
    'packages/core/shaders/linear_gradient_mask.frag';
    

}
