import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admod_points_provider.g.dart';

@Riverpod(keepAlive: true)
class AdmonPoints extends _$AdmonPoints {
  @override
  int build() => 0;

  void update(int value) {
    state = state + value;
  }

  void restart() {
    state = 0;
  }
}
