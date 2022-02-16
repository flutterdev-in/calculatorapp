import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';

class AdsController extends GetxController {
  Rx<int> days = 1.obs;
  @override
  void onInit() {
    loadDate();
    myBannerAd.load();
    super.onInit();
  }

    @override
    void onClose() {
      myBannerAd.dispose();
      super.onClose();
    }

  void loadDate() {
    Box sbox = Hive.box("settings");
    String firstdate = sbox.get("firstDate") ?? "null";
    if (firstdate == "null") {
      DateTime now = DateTime.now();
      sbox.put("firstDate", now.toString());
    }
     
  }

  final BannerAd myBannerAd = BannerAd(
    // adUnitId: "ca-app-pub-3940256099942544/6300978111", // test AD
    adUnitId: "ca-app-pub-7599104948188291/5579668154",
    size: AdSize.fullBanner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );

  // final BannerAdListener listener = BannerAdListener(
  //   // Called when an ad is successfully received.
  //   onAdLoaded: (Ad ad) => print('Ad loaded.'),
  //   // Called when an ad request failed.
  //   onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //     // Dispose the ad here to free resources.
  //     ad.dispose();
  //     print('Ad failed to load: $error');
  //   },
  //   // Called when an ad opens an overlay that covers the screen.
  //   onAdOpened: (Ad ad) => print('Ad opened.'),
  //   // Called when an ad removes an overlay that covers the screen.
  //   onAdClosed: (Ad ad) => print('Ad closed.'),
  //   // Called when an impression occurs on the ad.
  //   onAdImpression: (Ad ad) => print('Ad impression.'),
  // );
}
