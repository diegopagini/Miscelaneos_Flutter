import 'package:miscelaneos/config/plugins/share_preferences_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_preferences_provider.g.dart';

const storeKey = 'showAds';

@Riverpod(keepAlive: true)
class SharedPreferences extends _$SharedPreferences {
  @override
  bool build() {
    checkAdsState();
    return true;
  }

  void checkAdsState() async {
    state = await SharePreferencesPlugin.getBool(storeKey);
  }

  void removeAds() {
    SharePreferencesPlugin.setBool(storeKey, false);
    state = false;
  }

  void showAds() {
    SharePreferencesPlugin.setBool(storeKey, true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}
