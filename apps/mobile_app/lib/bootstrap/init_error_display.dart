import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/l10n/app_localizations.dart';


/// This widget is used when the app fails to initialize
/// (e.g. Firebase fails to initialize)
/// and shows a blocking error message.
class InitErrorDisplay extends StatelessWidget {
  const InitErrorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .ltr,
      child: const _ErrorContainer(),      
    );
  }

}

class _ErrorContainer extends StatelessWidget {
  const _ErrorContainer();

  @override
  Widget build(BuildContext context) {
    return BlockingAppMessage(
      title: AppLocalizations.of(context).initErrorTitle,
      body: AppLocalizations.of(context).initErrorBody,
    );
  }
}

class BlockingAppMessage extends StatelessWidget {

  final String title;
  final String body;
  final IconData iconData;

  const BlockingAppMessage({
    required this.title,
    required this.body,
    this.iconData = Icons.warning_rounded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPaper,
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 64,
            color: Colors.black,
          ),
          Gap.medium(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap.small(),
          Text(
            body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}
