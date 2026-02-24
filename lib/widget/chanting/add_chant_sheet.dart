import 'package:dhyana/model/chant.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

class AddChantSheet extends StatefulWidget {

  final List<Chant> availableChants;
  final void Function(Chant chant)? onChantSelected;

  const AddChantSheet({
    required this.availableChants,
    this.onChantSelected,
    super.key,
  });

  @override
  State<AddChantSheet> createState() => _AddChantSheetState();
}

class _AddChantSheetState extends State<AddChantSheet> {

  void _onListItemTap(Chant chant) {
    widget.onChantSelected?.call(chant);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ListView.builder(
          padding: EdgeInsets.only(
            top: 80,
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          itemCount: widget.availableChants.length,
          itemBuilder: (context, index) {
            final chant = widget.availableChants[index];
            return ListTile(
              title: Text(chant.name),
              trailing: IconButton(
                icon: Icon(Icons.add_circle_outline_rounded),
                onPressed: () => _onListItemTap(widget.availableChants[index]),
              ),
            );
          }
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingLg),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(DesignSpec.borderRadiusLg*2)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.backgroundPaper.withValues(alpha: 1.0),
                AppColors.backgroundPaper.withValues(alpha: 0.5),
              ],
              stops: [0.75, 1.0],

            ),
            // color: Colors.red,
          ),
          child: Center(
            child: Text('Add Chant',
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: MediaQuery.of(context).viewPadding.bottom + DesignSpec.spacingLg,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.backgroundPaper.withValues(alpha: 0.25),
                    AppColors.backgroundPaper.withValues(alpha: 1.0),
                  ],
                  stops: [0.0, 0.75],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

}

