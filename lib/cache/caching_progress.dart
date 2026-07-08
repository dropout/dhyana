import 'package:dhyana/model/chant.dart';
import 'package:dhyana/model/chant_local_resources.dart';

class CachingProgress {

  final double progress;
  final List<({Chant chant, ChantLocalResources localResources})> results;

  CachingProgress({
    required this.progress,
    this.results = const [],
  });

}