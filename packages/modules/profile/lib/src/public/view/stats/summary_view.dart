import 'package:material_ui/material_ui.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';


class const SummaryView({
  required final int sessionCount,
  required final int minutesCount,
  required final int daysCount,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppCard(
      key: const Key('summary_view'),
      title: ProfileLocalizations.of(context).statsSummary,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SummaryItem(
              sessionCount,
              ProfileLocalizations.of(context).sessionsPlural(sessionCount)
            )
          ),
          const SizedBox(width: DesignSpec.spacingMd),
          Expanded(
            child: SummaryItem(
              minutesCount,
              ProfileLocalizations.of(context).minutesPlural(minutesCount),
            )
          ),
          const SizedBox(width: DesignSpec.spacingMd),
          Expanded(
            child: SummaryItem(
              daysCount,
              ProfileLocalizations.of(context).daysPlural(daysCount),
            )
          )
        ],
      ),
    );
  }

}

class SummaryItem extends StatelessWidget {

  final String label;
  final int value;

  const SummaryItem(
    this.value,
    this.label,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DesignSpec.paddingMd),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value.toString(),
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            )
          )
        ],),
    );
  }

}
