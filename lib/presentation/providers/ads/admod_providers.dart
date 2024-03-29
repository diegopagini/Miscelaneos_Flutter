import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/plugins/admod_plugin.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admod_providers.g.dart';

@riverpod
Future<BannerAd> adBannerProvider(AdBannerProviderRef ref) async {
  final showAds = ref.watch(sharedPreferencesProvider);

  if (!showAds) throw Exception('Ads bloqued');

  final ad = await AdmodPlugin.loadBannerAd();
  return ad;
}

@riverpod
Future<InterstitialAd> adInterstitialProvider(
    AdInterstitialProviderRef ref) async {
  final showAds = ref.watch(sharedPreferencesProvider);

  if (!showAds) throw Exception('Ads bloqued');

  final ad = await AdmodPlugin.loadInterestialAd();
  return ad;
}

@riverpod
Future<RewardedAd> adRewardedProvider(AdRewardedProviderRef ref) async {
  final showAds = ref.watch(sharedPreferencesProvider);

  if (!showAds) throw Exception('Ads bloqued');

  final ad = await AdmodPlugin.loadRewardedAd();
  return ad;
}
