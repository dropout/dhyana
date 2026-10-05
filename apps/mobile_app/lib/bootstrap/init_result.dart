import 'package:core/core.dart';

class InitResult {

  final Services services;  
  final RemoteSettings remoteSettings;
  final String? userId;

  InitResult({
    required this.services,
    required this.remoteSettings,
    this.userId, 
  });

}
