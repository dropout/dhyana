import 'package:flutter/material.dart';

class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {

  late bool value;

  @override
  void initState() {
    value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Apple Health'),
          subtitle: const Text('Ülések szinkronizációja'),
          trailing: Switch(
            onChanged: (bool value) => setState(() => !this.value),
            value: value,
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }

}

