import 'package:ar_drawing_app/features/setting/widget/in_app_languages_screen.dart';
import 'package:ar_drawing_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:share_plus/share_plus.dart';

import '../../../common/app_style.dart';
import '../widget/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromRGBO(75, 79, 88, 1),
              )),
        ),
        title: Text(
          S.current.settings,
          style: AppStyle.titleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InAppLanguagesScreen()));
              },
              child: SettingsWidget(
                name: S.current.languages,
                imgAssets: 'assets/image/ic_languages.png',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(197, 202, 212, 0.2),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Share.share(
                    'https://play.google.com/store/apps/details?id=ar.drawing.sketch.paint.trace.draw.picture.paper&hl=vi&gl=US');
              },
              child: SettingsWidget(
                name: S.current.share,
                imgAssets: 'assets/image/ic_share.png',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(197, 202, 212, 0.2),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 14, 23, 192),
                      content: Container(
                        height: 312,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/ic_emoji_smile.jpg',
                              height: 80,
                            ),
                            const Text(
                              'We like you too!',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Thanks for your feedback',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            RatingBar.builder(
                                initialRating: 5,
                                itemCount: 5,
                                direction: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  );
                                },
                                onRatingUpdate: (value) {}),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'The best we can get :))',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue),
                                  child: TextButton(
                                    child: const Text(
                                      'RATE US',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SettingsWidget(
                name: S.current.rate_us,
                imgAssets: 'assets/image/ic_rate.png',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(197, 202, 212, 0.2),
            ),
            const SizedBox(
              height: 16,
            ),
            SettingsWidget(
              name: S.current.privacy_policy,
              imgAssets: 'assets/image/ic_privacy.png',
            ),
          ],
        ),
      ),
    );
  }
}
