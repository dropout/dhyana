import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BatchDownloadTask extends ChangeNotifier {
  final List<DownloadTask> _tasks;
  double _progress = 0.0;
  bool _isFinished = false;
  final Completer<void> _completer = Completer<void>();

  final StreamController<double> _progressController =
    StreamController<double>.broadcast();

  Future<void> get finished => _completer.future;
  double get progress => _progress;
  bool get isFinished => _isFinished;

  Stream<double> get progressStream => _progressController.stream;

  BatchDownloadTask(this._tasks) {
    Stream.fromIterable(_tasks)
      .asyncExpand((task) => task.snapshotEvents)
      .listen(_taskSnapshotListener)
      .onError(_taskSnapshotErrorHandler);
  }

  void _taskSnapshotListener(TaskSnapshot snapshot) {
    try {
      final calculatedProgress = calculateProgress();
      // Check if all tasks are completed
      final bool allCompleted = _tasks.every(
        (t) => t.snapshot.state == TaskState.success,
      );
      if (allCompleted) {
        _isFinished = true;
        _progress = 1.0;
        if (!_completer.isCompleted) _completer.complete();
        _progressController.add(_progress);
        _progressController.close();
      } else if (calculatedProgress != 1.0) {
        _progress = calculatedProgress;
        _progressController.add(_progress);
      }
      notifyListeners();
    } catch(e) {
      if (!_completer.isCompleted) {
        _completer.completeError(e);
      }
    }

  }

  Future<void> _taskSnapshotErrorHandler(dynamic error) async {
    // Cancel all tasks on error
    for (var task in _tasks) {
      switch (task.snapshot.state) {
        case TaskState.running:
          await task.cancel();
          break;
        case TaskState.paused:
          await task.cancel();
          break;
        default:
      }
    }

    // Propagate the error
    if (!_progressController.isClosed) {
      _progressController.close();
    }

    if (!_completer.isCompleted) {
      _completer.completeError(error);
    }
  }

  double calculateProgress() {
    if (_tasks.isEmpty) return 0.0;

    int totalBytes = _tasks.fold(
      0,
      (sum, task) => sum + (task.snapshot.totalBytes),
    );
    if (totalBytes == 0) return 0.0; // it's unreal but it can happen

    int downloadedBytes = _tasks.fold(
      0,
      (sum, task) => sum + (task.snapshot.bytesTransferred),
    );
    return downloadedBytes / totalBytes;
  }

  @override
  void dispose() {
    _progressController.close();
    super.dispose();
  }
}
