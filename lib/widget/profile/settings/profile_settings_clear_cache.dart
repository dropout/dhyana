import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/repository/chant_playback_repository.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ProfileSettingsClearCache extends StatefulWidget {
  final ChantPlaybackRepository chantPlaybackRepository;

  const ProfileSettingsClearCache({
    required this.chantPlaybackRepository,
    super.key,
  });

  @override
  State<ProfileSettingsClearCache> createState() =>
      _ProfileSettingsClearCacheState();
}

class _ProfileSettingsClearCacheState extends State<ProfileSettingsClearCache> {
  LoadingState loadingState = .idle;

  void _onButtonTap(BuildContext context) {
    setState(() {
      loadingState = .loading;
    });

    widget.chantPlaybackRepository.clearCache().then((_) {
      setState(() {
        loadingState = .loaded;
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
              if (loadingState == .loading || loadingState == .loaded) Spacer(),
              if (loadingState == .loading) CircularProgressIndicator.adaptive(

              ),
              if (loadingState == .loaded)
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
