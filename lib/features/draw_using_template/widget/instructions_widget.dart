import 'dart:typed_data';

import 'package:ar_drawing_app/common/app_style.dart';
import 'package:ar_drawing_app/features/draw_using_template/widget/sketch_widget.dart';
import 'package:ar_drawing_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget(
      {super.key, this.imageAssets, this.imageData, this.isGallery});
  final String? imageAssets;
  final Uint8List? imageData;
  final bool? isGallery;

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
          S.current.instructions,
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
            Image.asset('assets/image/instructions_img.png'),
            const SizedBox(
              height: 24,
            ),
            Text(
              S.current.draw_with_camera,
              style: AppStyle.categoryTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.current.instructions_description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(99, 99, 102, 1)),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 102),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SketchWidget(
                            imageAssets: imageAssets ?? '',
                            imageGallery: imageData,
                            isGallery: isGallery,
                          )));
                },
                child: Container(
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(41),
                      color: const Color.fromRGBO(55, 133, 250, 1)),
                  child: Center(
                    child: Text(
                      S.current.continue_text,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppStyle.fontFamily,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
