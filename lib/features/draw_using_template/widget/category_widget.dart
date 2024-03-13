import 'package:flutter/material.dart';

import '../model/category_model.dart';
import 'details_category_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 230, crossAxisCount: 2),
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsCategoryWidget(
                              title: listCategory[index].name,
                              index2: index,
                            )));
                  },
                  child: Image.asset(
                    listCategory[index].thumbnailsAssets,
                    height: 186,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                listCategory[index].name,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromRGBO(28, 28, 30, 1)),
              ),
            ],
          );
        });
  }
}
