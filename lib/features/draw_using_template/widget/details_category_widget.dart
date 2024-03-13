import 'package:ar_drawing_app/common/app_style.dart';
import 'package:ar_drawing_app/features/draw_using_template/model/category_model.dart';

import 'package:flutter/material.dart';

import 'instructions_widget.dart';

class DetailsCategoryWidget extends StatelessWidget {
  const DetailsCategoryWidget({
    super.key,
    required this.title,
    required this.index2,
  });
  final String title;
  final int index2;

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
          title,
          style: AppStyle.titleStyle,
        ),
      ),
      body: GridView.builder(
          itemCount: listCategory[index2].listImageAssets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InstructionsWidget(
                            imageAssets:
                                listCategory[index2].listImageAssets[index],
                            isGallery: true,
                          )));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(
                    listCategory[index2].listImageAssets[index],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
