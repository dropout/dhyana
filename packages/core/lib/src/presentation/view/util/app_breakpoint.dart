import 'package:core/src/presentation/design_spec.dart';
import 'package:flutter/widgets.dart';

/// A widget that builds different layouts based on the available width.
/// It takes two builders: [wide] for layouts wider than the breakpoint 
/// and [narrow] for layouts narrower than the breakpoint.
class const AppBreakPointBuilder({
  final Widget Function(BuildContext context, BoxConstraints constraints)? wide,
  final Widget Function(BuildContext context, BoxConstraints constraints)? narrow,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > DesignSpec.breakpointSm) {
          return wide?.call(context, constraints) ?? const SizedBox.shrink();
        } else {
          return narrow?.call(context, constraints) ?? const SizedBox.shrink();
        }        
      },
    );
  }

}
