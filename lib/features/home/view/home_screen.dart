import 'dart:typed_data';

import 'package:ar_drawing_app/common/app_style.dart';

import 'package:ar_drawing_app/features/draw_using_template/view/draw_using_template_screen.dart';
import 'package:ar_drawing_app/features/draw_using_template/widget/instructions_widget.dart';
import 'package:ar_drawing_app/features/home/model/home_button_model.dart';
import 'package:ar_drawing_app/features/setting/view/settings_screen.dart';
import 'package:background_remover/background_remover.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? _imageData;

  Future<void> _pickAndProcessImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();

      // First, remove the background
      final processedImage = await removeBackground(imageBytes: imageBytes);

      // Then, convert the resulting image to line art
      final originalImage = img.decodeImage(processedImage);
      final grayscaleImage = img.grayscale(originalImage!);
      final lineArtImage = img.sobel(grayscaleImage);
      final invertedImage = img.invert(lineArtImage);

      setState(() {
        _imageData = Uint8List.fromList(img.encodePng(invertedImage));
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InstructionsWidget(
                imageData: _imageData,
                isGallery: false,
              )));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please choose image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            'assets/image/home_bg.png',
            fit: BoxFit.cover,
          ),
          Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 255, 255, 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/image/ic_settings.png'),
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: 470,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: content.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () async {
                          if (index == 0) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const DrawUsingTemplateScreen()));
                          } else {
                            await _pickAndProcessImage();
                            // ignore: use_build_context_synchronously
                          }
                        },
                        child: Container(
                          height: 148,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: content[index].color),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 26,
                              ),
                              Image.asset(
                                content[index].imageAssets,
                                height: 34,
                                width: 34,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  content[index].name,
                                  style: const TextStyle(
                                      fontFamily: AppStyle.fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(44, 44, 46, 1)),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
