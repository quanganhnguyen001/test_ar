import 'package:flutter/material.dart';

import '../../../common/app_style.dart';

class PageContentWidget extends StatelessWidget {
  const PageContentWidget(
      {super.key,
      required this.imageAssets,
      required this.title,
      required this.label});
  final String imageAssets;
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Image.asset(
          imageAssets,
          height: 320,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: AppStyle.fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(46, 47, 63, 1))),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: AppStyle.fontFamily,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(99, 99, 102, 1))),
        ),
      ],
    ));
  }
}
