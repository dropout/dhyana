import 'package:dhyana/model/presence.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:flutter/material.dart';

import 'presence_list_item.dart';

class PresenceList extends StatelessWidget {

  final List<Presence> presenceList;

  const PresenceList({
    required this.presenceList,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: AppThemeData.spacingLg,
      spacing: AppThemeData.spacingLg,
      children: presenceList.map(
        (p) => PresenceListItem(presence: p)
      ).toList(),
    );
  }

}
