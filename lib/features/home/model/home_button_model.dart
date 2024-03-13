import 'package:ar_drawing_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeButtonModel {
  final String name;
  final String imageAssets;
  final Color color;

  HomeButtonModel(
      {required this.name, required this.imageAssets, required this.color});
}

final content = [
  HomeButtonModel(
      name: S.current.home_using_template,
      imageAssets: 'assets/image/using_template_img.png',
      color: const Color.fromRGBO(255, 237, 229, 1)),
  HomeButtonModel(
      name: S.current.home_using_gallery_photos,
      imageAssets: 'assets/image/using_gallery_img.png',
      color: const Color.fromRGBO(209, 234, 255, 1)),
  // HomeButtonModel(
  //     name: 'My Creation',
  //     imageAssets: 'assets/image/my_creation_img.png',
  //     color: const Color.fromRGBO(244, 235, 255, 1)),
  // HomeButtonModel(
  //     name: 'Tutorial',
  //     imageAssets: 'assets/image/tutorial_img.png',
  //     color: const Color.fromRGBO(255, 235, 240, 1)),
];
