import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionNumber extends StatefulWidget {
  const AppVersionNumber({super.key});

  @override
  State<AppVersionNumber> createState() => _AppVersionNumber();
}

class _AppVersionNumber extends State<AppVersionNumber> {

  PackageInfo _packageInfo = PackageInfo(
    appName: '?',
    packageName: '?',
    version: '?',
    buildNumber: '?',
    buildSignature: '?',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('v${_packageInfo.version}'
          '+${_packageInfo.buildNumber} ',
      style: const TextStyle(
        color: Colors.black54
      ),
    );
  }

}
