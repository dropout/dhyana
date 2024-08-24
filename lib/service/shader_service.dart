import 'dart:ui';

class ShaderService {

  final Map<String, FragmentShader> shaders = {};

  Future<FragmentShader> loadShader(String assetKey) async {
    if (shaders.containsKey(assetKey)) {
      return shaders[assetKey]!;
    }
    FragmentProgram program = await FragmentProgram.fromAsset(assetKey);
    FragmentShader shader = program.fragmentShader();
    shaders[assetKey] = shader;
    return shader;
  }

  FragmentShader get(String assetKey) {
    if (shaders.containsKey(assetKey)) {
      return shaders[assetKey]!;
    } else {
      throw Exception('No shader found in cache with assetKey: $assetKey');
    }
  }

}
