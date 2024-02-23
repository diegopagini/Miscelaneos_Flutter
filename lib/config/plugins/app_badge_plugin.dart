import 'package:flutter_app_badger/flutter_app_badger.dart';

class AppBadgePlugin {
  static Future<bool> get isBadgeSuported {
    return FlutterAppBadger.isAppBadgeSupported();
  }

  static void updateBadgeCount(int count) async {
    if (!await isBadgeSuported) return;

    FlutterAppBadger.updateBadgeCount(count);

    if (count == 0) removeBadge();
  }

  static void removeBadge() async {
    if (!await isBadgeSuported) return;

    FlutterAppBadger.removeBadge();
  }
}
