import 'package:ar_drawing_app/features/first_languages/bloc/languages_bloc.dart';

import 'package:ar_drawing_app/features/first_languages/model/languages_model.dart';
import 'package:ar_drawing_app/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../common/app_style.dart';

class FirstLanguagesScreen extends StatefulWidget {
  const FirstLanguagesScreen({super.key});

  @override
  State<FirstLanguagesScreen> createState() => _FirstLanguagesScreenState();
}

class _FirstLanguagesScreenState extends State<FirstLanguagesScreen> {
  late AppOpenAd appOpenAd;
  late InterstitialAd interstitialAd;
  late NativeAd nativeAd;
  bool isAdLoaded = false;
  loadAds() async {
    await loadAppOpenAd();
    await loadInterAd();
  }

  loadNativeAd() {
    nativeAd = NativeAd(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            setState(() {
              isAdLoaded = false;
            });
          },
        ),
        request: AdRequest(),
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.medium));

    nativeAd.load();
  }

  loadInterAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
        interstitialAd = ad;
        interstitialAd.show();
      }, onAdFailedToLoad: (error) {
        print(error);
      }),
    );
  }

  loadAppOpenAd() {
    AppOpenAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/9257395921',
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
          appOpenAd = ad;
          appOpenAd.show();
        }, onAdFailedToLoad: (error) {
          print(error);
        }),
        orientation: AppOpenAd.orientationPortrait);
  }

  @override
  void initState() {
    loadAds();
    loadNativeAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Languages",
          style: AppStyle.titleStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ));
              },
              icon: const Icon(
                Icons.check,
                color: Color.fromRGBO(55, 133, 250, 1),
              )),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: BlocBuilder<LanguagesBloc, LanguagesState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: listLanguages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: InkWell(
                        onTap: () {
                          context.read<LanguagesBloc>().add(SubmitLanguageEvent(
                              locale: Locale(listLanguages[index].languageCode),
                              selectedIndex: index));
                        },
                        child: Container(
                          height: 48,
                          decoration: state.selectedIndex != index
                              ? BoxDecoration(
                                  color: const Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(24))
                              : BoxDecoration(
                                  color:
                                      const Color.fromRGBO(55, 133, 250, 0.3),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(55, 133, 250, 1),
                                      width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  listLanguages[index].imageAssest,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  listLanguages[index].name,
                                  style: const TextStyle(
                                      fontFamily: 'SVNGilroy Bold',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 28,
          ),
          isAdLoaded
              ? Expanded(
                  child: AdWidget(ad: nativeAd),
                )
              : Container()
        ],
      ),
    );
  }
}
