import 'package:ar_drawing_app/common/app_style.dart';

import 'package:ar_drawing_app/generated/l10n.dart';

import 'package:flutter/material.dart';

import '../widget/category_widget.dart';
import '../widget/drawing_steps_widget.dart';

class DrawUsingTemplateScreen extends StatefulWidget {
  const DrawUsingTemplateScreen({super.key});

  @override
  State<DrawUsingTemplateScreen> createState() =>
      _DrawUsingTemplateScreenState();
}

class _DrawUsingTemplateScreenState extends State<DrawUsingTemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              S.current.home_using_template,
              style: AppStyle.titleStyle,
            ),
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
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TabBar(
                    unselectedLabelStyle: const TextStyle(
                        fontFamily: AppStyle.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(120, 123, 130, 1)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    labelStyle: const TextStyle(
                        fontFamily: AppStyle.fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color.fromRGBO(55, 133, 250, 1)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(0, 2),
                              blurRadius: 6,
                              spreadRadius: 0)
                        ],
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        text: S.current.category,
                      ),
                      Tab(
                        text: S.current.drawing_step,
                      )
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                      children: [CategoryWidget(), DrawingStepsWidget()]),
                )
              ],
            ),
          )),
    );
  }
}
