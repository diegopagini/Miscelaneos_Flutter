import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'badge_counter_provider.g.dart';

@riverpod
class BadgeCounter extends _$BadgeCounter {
  @override
  int build() => 0;

  void invalidate() {
    state = 0;
  }

  void update() {
    state = state + 1;
  }
}
