import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/profile/profile_image.dart';
import 'package:flutter/material.dart';

class PresenceArea extends StatefulWidget {

  final Profile profile;

  const PresenceArea({
    required this.profile,
    super.key
  });

  @override
  State<PresenceArea> createState() => _PresenceAreaState();
}

class _PresenceAreaState extends State<PresenceArea> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Practiced with you',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        Wrap(
          runSpacing: AppThemeData.spacingLg,
          spacing: AppThemeData.spacingLg,
          children: List.generate(12, (index) {
            return buildItem(context, index);
          }),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        buildTotalCountDisplay(context),
      ],
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Column(
      children: [
        ProfileImage.fromProfile(Profile.anonymous(), size: 48),
        const SizedBox(height: AppThemeData.spacingSm),
        Text(
          'Boddhisatva',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  Widget buildTotalCountDisplay(BuildContext context) {
    return Text(
      'and 32 more...',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

}
