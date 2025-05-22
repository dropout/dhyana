import 'dart:ui';

abstract class ShaderService {
  Future<FragmentShader> loadShader(String assetKey);
  FragmentShader get(String assetKey);
}
