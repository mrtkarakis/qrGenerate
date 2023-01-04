import 'dart:async' as async;
import 'dart:developer' as developer;

class DeveloperService {
  static DeveloperService? _instance;
  static DeveloperService get instance {
    _instance ??= DeveloperService._init();
    return _instance!;
  }

  DeveloperService._init();
  void developerLog(
    String? message, {
    final String name = "developerLog",
    final Object? error,
    final int level = 0,
    final int? sequenceNumber,
    final StackTrace? stackTrace,
    DateTime? time,
    final DateTime? startTime,
    final DateTime? endTime,
    final async.Zone? zone,
  }) {
    time = time ?? DateTime.now();
    final Duration? duration = endTime != null && startTime != null
        ? endTime.difference(startTime)
        : null;
    developer.log(
        "<<time: $time>> ${duration != null ? 'duration: ${duration.inMilliseconds},' : ""} $message",
        name: name,
        error: error,
        level: level,
        sequenceNumber: sequenceNumber,
        stackTrace: stackTrace,
        time: time,
        zone: zone);
  }
}
