import 'package:assets/assets.dart';
import 'package:core/src/presentation/view/painting/inset_shadow_painter.dart';
import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/src/presentation/design_spec.dart';

class const InsetSurface({
  required final Widget child,
  final EdgeInsetsGeometry padding = EdgeInsets.zero,
  final double borderRadius = DesignSpec.borderRadiusMd,
  final Color shadowColor = const Color(0x33000000),
  final double blurRadius = 20.0,
  final Offset offset = const Offset(5, 5),  
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Colors.black.withValues(alpha: 0.6);
    final shader = context.services.shaderService.get(
      Assets.shaderInsetShadow,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CustomPaint(
        foregroundPainter: ShaderInsetShadowPainter(
          shader: shader,
          shadowColor: shadowColor,
          blurRadius: blurRadius,
          borderRadius: borderRadius,
          offset: offset,
        ),
        child: Container(
          // width: width,
          // height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: AppColors.backgroundPaperDark,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );    
  }
}
