import 'package:flutter/material.dart';
import 'package:dhyana/widget/settings/settings_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: const AppSettingsView(),
    );
  }
}
