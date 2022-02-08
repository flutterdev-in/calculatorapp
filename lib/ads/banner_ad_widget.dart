import 'package:calculator_04/ads/ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdW extends StatelessWidget {
  BannerAdW({Key? key}) : super(key: key);
  AdsController adc = Get.put(AdsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AdWidget(ad: adc.myBannerAd),
      width: adc.myBannerAd.size.width.toDouble(),
      height: adc.myBannerAd.size.height.toDouble(),
    );
  }
}
