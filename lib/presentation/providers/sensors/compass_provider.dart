import 'package:flutter_compass/flutter_compass.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compass_provider.g.dart';

@riverpod
Stream<double?> compass(CompassRef ref) async* {
  if (FlutterCompass.events == null) {
    throw Exception('Device does not have sensors!');
  }

  try {
    await for (final event in FlutterCompass.events!) {
      yield event.heading;
    }
  } catch (e) {
    throw Exception('Error getting heading $e!');
  }
}
