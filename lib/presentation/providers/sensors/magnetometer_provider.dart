import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'magnetometer_provider.g.dart';

class MagnetometerXYZ {
  final double x;
  final double y;
  final double z;

  MagnetometerXYZ({required this.x, required this.y, required this.z});

  @override
  String toString() {
    return '''
      x:$x,
      y:$y,
      z:$z,
    ''';
  }
}

@riverpod
Stream<MagnetometerXYZ> magnetometer(MagnetometerRef ref) async* {
  await for (final event in magnetometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));

    yield MagnetometerXYZ(x: x, y: y, z: z);
  }
}
