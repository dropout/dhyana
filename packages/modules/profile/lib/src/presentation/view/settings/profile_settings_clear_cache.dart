import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

class ProfileSettingsClearCache extends StatefulWidget {
  final ClearCacheCapability clearCacheCapability;

  const ProfileSettingsClearCache({
    required this.clearCacheCapability,
    super.key,
  });

  @override
  State<ProfileSettingsClearCache> createState() =>
      _ProfileSettingsClearCacheState();
}

class _ProfileSettingsClearCacheState extends State<ProfileSettingsClearCache> {
  ProcessingState loadingState = .idle;

  Future<void> _onButtonTap() async {
    setState(() {
      loadingState = .processing;
    });

    try {
      await widget.clearCacheCapability();
      if (!mounted) return;
      setState(() {
        loadingState = .completed;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        loadingState = .idle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          padding: const EdgeInsets.symmetric(
            vertical: DesignSpec.paddingMd,
            horizontal: DesignSpec.paddingXl,
          ),
          onPressed: _onButtonTap,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          disabledElevation: 0,
          shape: const StadiumBorder(),
          fillColor: AppColors.backgroundPaperLight,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              Text(
                context.l10n.clearCache,
                textAlign: TextAlign.start,
                style: context.theme.textTheme.titleSmall?.copyWith(
                  color: Colors.black,
                ),
              ),
              if (loadingState == .processing || loadingState == .completed)
                Spacer(),
              if (loadingState == .processing)
                CircularProgressIndicator.adaptive(),
              if (loadingState == .completed)
                Icon(Icons.check_circle_outline_rounded, size: 20),
            ],
          ),
        ),
        Gap.small(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingXl),
          child: Text(
            context.l10n.clearCacheDescription,
            style: context.theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
