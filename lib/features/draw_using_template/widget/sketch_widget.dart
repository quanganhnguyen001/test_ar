import 'dart:typed_data';

import 'package:ar_drawing_app/common/app_style.dart';
import 'package:ar_drawing_app/features/draw_using_template/bloc/draw_using_template_bloc.dart';
import 'package:ar_drawing_app/features/home/view/home_screen.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:matrix_gesture_detector_pro/matrix_gesture_detector_pro.dart';

class SketchWidget extends StatefulWidget {
  const SketchWidget(
      {super.key,
      required this.imageAssets,
      this.isGallery,
      this.imageGallery});
  final String imageAssets;
  final bool? isGallery;
  final Uint8List? imageGallery;

  @override
  State<SketchWidget> createState() => _SketchWidgetState();
}

class _SketchWidgetState extends State<SketchWidget> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller?.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'AR Drawing',
          style: TextStyle(
            fontSize: 18,
            fontFamily: AppStyle.fontFamily,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(252, 252, 252, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromRGBO(252, 252, 252, 1),
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              },
              child: Image.asset(
                'assets/image/ic_home.png',
                height: 24,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<DrawUsingTemplateBloc, DrawUsingTemplateState>(
        builder: (context, state) {
          return FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    SizedBox(
                        height: double.infinity,
                        child: CameraPreview(_controller!)),
                    // Adjust the position, size, etc. of the image as needed
                    MatrixGestureDetector(
                      onMatrixUpdate: (m, tm, sm, rm) {
                        notifier.value = m;
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Opacity(
                              opacity: state.currentValue / 100,
                              child: state.isLock
                                  ? widget.isGallery == false
                                      ? Transform.flip(
                                          flipX: state.isFlip,
                                          child: Image.memory(
                                            widget.imageGallery!,
                                            height: 300,
                                          ),
                                        )
                                      : Transform.flip(
                                          flipX: state.isFlip,
                                          child: Image.asset(
                                            widget.imageAssets,
                                            height: 300,
                                          ),
                                        )
                                  : AnimatedBuilder(
                                      animation: notifier,
                                      builder: (context, child) {
                                        return Transform(
                                          transform: notifier.value,
                                          child: widget.isGallery == false
                                              ? Transform.flip(
                                                  flipX: state.isFlip,
                                                  child: Image.memory(
                                                    widget.imageGallery!,
                                                    height: 300,
                                                  ),
                                                )
                                              : Transform.flip(
                                                  flipX: state.isFlip,
                                                  child: Image.asset(
                                                    widget.imageAssets,
                                                    height: 300,
                                                  ),
                                                ),
                                        );
                                      })),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              height: 76,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color.fromRGBO(0, 0, 0, 0.3)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Sketch Opacity',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppStyle.fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${state.currentValue.round()}%',
                                          style: const TextStyle(
                                              fontFamily: AppStyle.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        Expanded(
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                                    thumbColor:
                                                        const Color.fromRGBO(55,
                                                            133, 250, 1),
                                                    activeTickMarkColor: Colors
                                                        .transparent,
                                                    inactiveTickMarkColor:
                                                        Colors.transparent,
                                                    activeTrackColor:
                                                        Colors.white),
                                            child: Slider(
                                                max: 100,
                                                value: state.currentValue,
                                                divisions: 10,
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          DrawUsingTemplateBloc>()
                                                      .add(OpacityEvent(
                                                          currentValue: value));
                                                }),
                                          ),
                                        ),
                                        const Text('100%',
                                            style: TextStyle(
                                                fontFamily: AppStyle.fontFamily,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (state.isFlash == false) {
                                    context
                                        .read<DrawUsingTemplateBloc>()
                                        .add(const FlashEvent(isFlash: true));
                                    _controller?.setFlashMode(FlashMode.torch);
                                  } else {
                                    context
                                        .read<DrawUsingTemplateBloc>()
                                        .add(const FlashEvent(isFlash: false));
                                    _controller?.setFlashMode(FlashMode.off);
                                  }
                                },
                                child: Container(
                                  height: state.isFlash ? 45 : 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.isFlash
                                          ? const Color.fromRGBO(
                                              55, 133, 250, 1)
                                          : const Color.fromRGBO(0, 0, 0, 0.3)),
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          state.isFlash ? 12 : 9),
                                      child: state.isFlash
                                          ? Image.asset(
                                              'assets/image/ic_flash.png',
                                            )
                                          : Image.asset(
                                              'assets/image/ic_not_flash.png',
                                            )),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<DrawUsingTemplateBloc>()
                                      .add(LockEvent(isLock: !state.isLock));
                                },
                                child: Container(
                                  height: state.isLock ? 42 : 47,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.isLock
                                          ? const Color.fromRGBO(
                                              55, 133, 250, 1)
                                          : const Color.fromRGBO(0, 0, 0, 0.3)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: state.isLock
                                          ? Image.asset(
                                              'assets/image/ic_lock.png',
                                            )
                                          : Image.asset(
                                              'assets/image/ic_not_lock.png',
                                            )),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<DrawUsingTemplateBloc>()
                                      .add(FlipEvent(isFlip: !state.isFlip));
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.isFlip
                                          ? const Color.fromRGBO(
                                              55, 133, 250, 1)
                                          : const Color.fromRGBO(0, 0, 0, 0.3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Image.asset(
                                      'assets/image/ic_not_flip.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
