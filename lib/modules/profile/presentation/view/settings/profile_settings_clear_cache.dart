import 'package:dhyana/core/domain/enum/processing_state.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:dhyana/core/presentation/view/util/gap.dart';
import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:flutter/material.dart';

class ProfileSettingsClearCache extends StatefulWidget {
  final ChantingPublicApi chantPlaybackRepository;

  const ProfileSettingsClearCache({
    required this.chantPlaybackRepository,
    super.key,
  });

  @override
  State<ProfileSettingsClearCache> createState() =>
      _ProfileSettingsClearCacheState();
}

class _ProfileSettingsClearCacheState extends State<ProfileSettingsClearCache> {
  ProcessingState loadingState = .idle;

  void _onButtonTap(BuildContext context) {
    setState(() {
      loadingState = .processing;
    });

    widget.chantPlaybackRepository.clearCachedChants().then((_) {
      setState(() {
        loadingState = .completed;
      });
    });
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
          onPressed: () => _onButtonTap(context),
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
              if (loadingState == .processing || loadingState == .completed) Spacer(),
              if (loadingState == .processing) CircularProgressIndicator.adaptive(

              ),
              if (loadingState == .completed)
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 20,
                )
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
