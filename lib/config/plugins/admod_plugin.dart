import 'package:google_mobile_ads/google_mobile_ads.dart';

// TODO: change for real one.
const adBannerId = '/6499/example/banner';

class AdmodPlugin {
  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static Future<BannerAd> loadBannerAd() async {
    return BannerAd(
      adUnitId: adBannerId,
      request: const AdManagerAdRequest(),
      size: AdSize.banner,
      listener: AdManagerBannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          print('$ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          print('AdManagerBannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }
}
