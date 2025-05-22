import 'dart:ui';

import 'package:dhyana/service/shader_service.dart';

class DefaultShaderService implements ShaderService {

  final Map<String, FragmentShader> shaders = {};

  @override
  Future<FragmentShader> loadShader(String assetKey) async {
    if (shaders.containsKey(assetKey)) {
      return shaders[assetKey]!;
    }
    FragmentProgram program = await FragmentProgram.fromAsset(assetKey);
    FragmentShader shader = program.fragmentShader();
    shaders[assetKey] = shader;
    return shader;
  }

  @override
  FragmentShader get(String assetKey) {
    if (shaders.containsKey(assetKey)) {
      return shaders[assetKey]!;
    } else {
      throw Exception('No shader found in cache with assetKey: $assetKey');
    }
  }

}
