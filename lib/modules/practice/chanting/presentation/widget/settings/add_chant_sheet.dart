import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/util/app_button.dart';
import 'package:dhyana/core/presentation/util/app_cached_network_image.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:dhyana/core/presentation/util/inset_surface.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    context.hapticsTap();
  }

  void _onOkayPressed(BuildContext context) {
    context.pop();
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingLg),
            child: Text(
              context.l10n.chantingAddChantSheetTitle,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSpec.paddingLg,
              ),
              child: switch (widget.availableChants.isEmpty) {
                true => buildEmptyState(context),
                false => buildChantsAvailableState(context),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: DesignSpec.padding2Xl,
              bottom: DesignSpec.padding2Xl,
            ),
            child: AppButton(
              onTap: () => _onOkayPressed(context),
              text: context.l10n.close.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyState(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.chantingAddChantSheetEmptyState,
        textAlign: TextAlign.center,
        style: context.theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildChantsAvailableState(BuildContext context) {
    
    return InsetSurface(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingMd),
      child: Scrollbar(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: DesignSpec.paddingMd,
              ),
              itemCount: widget.availableChants.length,
              itemBuilder: (context, index) {
                final chant = widget.availableChants[index];
                final paddingBottom =
                    index != widget.availableChants.length - 1;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: paddingBottom ? DesignSpec.paddingSm : 0.0,
                  ),
                  child: ChantListItem(
                    chant: chant,
                    onTap: () => _onListItemTap(chant),
                  ),
                );
              },
            ),
          ),
    );    
  }
}

class _AddChantButton extends StatefulWidget {
  const _AddChantButton({required this.onTap});

  final VoidCallback? onTap;

  @override
  State<_AddChantButton> createState() => _AddChantButtonState();
}

class _AddChantButtonState extends State<_AddChantButton> {
  bool _showCheckIcon = false;

  Future<void> _handleTap() async {
    if (_showCheckIcon) {
      return;
    }

    widget.onTap?.call();
    setState(() {
      _showCheckIcon = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (!mounted) {
      return;
    }

    setState(() {
      _showCheckIcon = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 24,
      child: DecoratedBox(
        decoration: ShapeDecoration(shape: StadiumBorder()),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            backgroundColor: _showCheckIcon ? Colors.green : AppColors.gold,
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpec.paddingMd,
              vertical: DesignSpec.paddingSm,
            ),
            minimumSize: const Size(0, 24),
          ),
          label: Text(
            _showCheckIcon
                ? context.l10n.chantingAddChantListItemAddedAction.toUpperCase()
                : context.l10n.chantingAddChantListItemAddAction.toUpperCase(),
            style: context.theme.textTheme.labelSmall!.copyWith(
              color: _showCheckIcon ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(
            _showCheckIcon
                ? Icons.check_circle_rounded
                : Icons.add_circle_outline_rounded,
            color: _showCheckIcon ? Colors.white : Colors.black,
          ),
          onPressed: _handleTap,
        ),
      ),
    );
  }
}

class ChantListItem extends StatelessWidget {
  final Chant chant;
  final VoidCallback? onTap;

  const ChantListItem({required this.chant, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          AppCachedNetworkImage(
            imagePath: '/chants/${chant.id}/cover.jpg',
            blurHash: chant.blurHash,
            resourceResolver: context.services.resourceResolver,
            borderRadius: DesignSpec.borderRadiusMd,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: DesignSpec.paddingSm,
                horizontal: DesignSpec.paddingMd,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(DesignSpec.borderRadiusMd),
                ),
              ),
              child: Text(
                chant.name,
                style: context.theme.textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(top: 8, right: 8, child: _AddChantButton(onTap: onTap)),
        ],
      ),
    );
  }
}
