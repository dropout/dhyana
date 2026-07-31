import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/entity/remote_settings.dart';

class InitResult {

  final Services services;
  final Repositories repositories;
  
  final RemoteSettings remoteSettings;
  final String? userId;

  InitResult({
    required this.services,
    required this.repositories,
    required this.remoteSettings,
    this.userId, 
  });

}
