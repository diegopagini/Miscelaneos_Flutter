import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/plugins/admod_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admod_providers.g.dart';

@riverpod
Future<BannerAd> adBannerProvider(AdBannerProviderRef ref) async {
  final ad = await AdmodPlugin.loadBannerAd();
  return ad;
}
