import 'package:dhyana/widget/util/app_version_number.dart';
import 'package:flutter/material.dart';

class ProfileFooter extends StatelessWidget {

  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Center(child: AppVersionNumber()),
    );
  }

}
