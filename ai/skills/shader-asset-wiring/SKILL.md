---
name: shader-asset-wiring
description: 'Wire a newly added Flutter fragment shader into the Dhyana app. Use after placing a .frag shader in packages/assets/shaders, or when fixing missing shader asset registration, core Assets keys, or startup preloading.'
---

# Dhyana Shader Asset Wiring

## When to Use

Use after a `.frag` shader has been added to `packages/assets/shaders/` and needs to be available to the application. This workflow registers the asset, exposes its key centrally, and preloads it during startup.

## Procedure

1. Confirm the shader file exists in `packages/assets/shaders/` and note its exact filename.
2. Add `shaders/<filename>.frag` to the `flutter.shaders` list in `packages/assets/pubspec.yaml`, keeping the entries alphabetized.
3. Add a constant under the Shaders section of `packages/core/lib/src/util/assets.dart`. Follow the existing naming pattern, for example:

   ```dart
   static const String shaderExampleName =
       'packages/assets/shaders/example_name.frag';
   ```

   Use a descriptive camelCase identifier prefixed with `shader`. The value must be the package asset key, not the shorter pubspec path.
4. In `apps/mobile_app/lib/bootstrap/initializer.dart`, preload the shader alongside the existing shader calls:

   ```dart
   await services.shaderService.loadShader(Assets.shaderExampleName);
   ```

   Pass the `Assets` constant, not an inline string. This same key is used by `ShaderService` to load and cache the compiled shader.
5. If the shader is used in Widgetbook, add the same `Assets` constant to the preload list in `apps/widgetbook/lib/main.dart` as well.

## Completion Checks

- The shader filename appears in `packages/assets/pubspec.yaml` under `flutter.shaders`.
- The `Assets` constant points to `packages/assets/shaders/<filename>.frag` and matches the shader filename exactly.
- The app initializer preloads that constant. No inline shader asset paths are introduced.
- If the shader is used in Widgetbook, its preload list uses the same constant.
- Run the relevant Flutter analyze/build check for the app or package. A build that compiles the shader is the check that can catch shader compilation errors; analyzer-only checks do not validate GLSL compilation.