import 'package:dhyana/model/presence.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

import 'presence_list_item.dart';

class PresenceList extends StatelessWidget {

  final List<Presence> presenceList;
  final Color textColor;

  const PresenceList({
    required this.presenceList,
    this.textColor = Colors.black,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: AppThemeData.spacingLg,
      spacing: AppThemeData.spacingLg,
      children: presenceList.map(
        (p) => PresenceListItem(
          presence: p,
          textColor: textColor,
        )
      ).toList(),
    );
  }

}
