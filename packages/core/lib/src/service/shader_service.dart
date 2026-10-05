import 'dart:ui';

abstract interface class ShaderService {
  Future<FragmentShader> loadShader(String assetKey);
  FragmentShader get(String assetKey);
  void close();
}
