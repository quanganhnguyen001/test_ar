import 'package:ar_drawing_app/features/draw_using_template/model/category_model.dart';
import 'package:ar_drawing_app/features/draw_using_template/widget/instructions_widget.dart';

import 'package:flutter/material.dart';

class DrawingStepsWidget extends StatelessWidget {
  const DrawingStepsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listImageDrawingStep.length,
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
                        builder: (context) => InstructionsWidget(
                              imageAssets: listImageDrawingStep[index],
                              isGallery: true,
                            )));
                  },
                  child: Image.asset(
                    listImageDrawingStep[index],
                    height: 186,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
