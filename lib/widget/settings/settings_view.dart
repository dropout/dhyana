import 'package:flutter/material.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/service/health_service.dart';

class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {

  final HealthService healthService = HealthService();
  AppSettings appSettings = const AppSettings(appleHealthSync: false);

  void _onAppleHealthSwitch(bool value) async {
    if (value == false) {
      setState(() {
        appSettings = appSettings.copyWith(
          appleHealthSync: value,
        );
      });
      return;
    }

    bool hasPermission = await healthService.hasHealthPermission();
    if (!hasPermission) {
      bool requestSuccessful = await healthService.requestHealthPermission();

      if (requestSuccessful) {
        print('had no permission, but requiesting succeeded');
      } else {
        print('has no permission and requesting permission failed');
      }

    } else {
      print('has permission');
      setState(() {
        appSettings = appSettings.copyWith(
          appleHealthSync: value,
        );
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Apple Health'),
          subtitle: Text('Ülések szinkronizációja'),
          trailing: Switch(
            onChanged: (bool value) => _onAppleHealthSwitch(value),
            value: appSettings.appleHealthSync,
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }

}

