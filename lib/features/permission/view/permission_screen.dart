import 'package:ar_drawing_app/common/app_style.dart';
import 'package:ar_drawing_app/features/home/view/home_screen.dart';
import 'package:ar_drawing_app/features/permission/bloc/permission_bloc.dart';

import 'package:ar_drawing_app/generated/l10n.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.current.permission,
          style: AppStyle.titleStyle,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 57,
          ),
          Center(
            child: Image.asset(
              'assets/image/permission_bg.png',
              height: 178,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 49),
            child: Text(
              S.current.permission_description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: AppStyle.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(99, 99, 102, 1)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 242, 244, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      S.current.allow_access,
                      style: const TextStyle(
                          fontFamily: AppStyle.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(26, 30, 35, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: BlocBuilder<PermissionBloc, PermissionState>(
                      builder: (context, state) {
                        if (state is SwitchLoaded) {
                          return FlutterSwitch(
                              height: 20,
                              activeColor:
                                  const Color.fromRGBO(55, 133, 250, 1),
                              width: 42,
                              toggleSize: 14,
                              value: state.switchValue,
                              onToggle: (value) async {
                                context
                                    .read<PermissionBloc>()
                                    .add(SaveSwitchEvent(switchValue: value));
                              });
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 86,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement((MaterialPageRoute(
                  builder: (context) => const HomeScreen())));
            },
            child: Text(
              S.current.continue_text,
              style: const TextStyle(
                  fontFamily: AppStyle.fontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(55, 133, 250, 1)),
            ),
          )
        ],
      ),
    );
  }
}
