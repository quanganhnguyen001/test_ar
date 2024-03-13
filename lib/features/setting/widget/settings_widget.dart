import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.name,
    required this.imgAssets,
  });
  final String name;
  final String imgAssets;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(55, 133, 250, 0.08)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(imgAssets),
            )),
        const SizedBox(
          width: 16,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(30, 35, 46, 1),
          ),
        )
      ],
    );
  }
}
