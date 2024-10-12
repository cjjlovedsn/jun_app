import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTestScreen extends StatefulWidget {
  const VideoTestScreen({Key? key}) : super(key: key);

  @override
  State<VideoTestScreen> createState() => _VideoTestScreenState();
}

class _VideoTestScreenState extends State<VideoTestScreen> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: buildBody()),
      ),
    );
  }

  Widget buildBody() {
    if (controller != null) {
      return Column(
        children: [
          controller!.value.isInitialized ? AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: VideoPlayer(controller!),
          ) : Container(),
          ElevatedButton(
            onPressed: () {
              controller?.dispose();
              controller = null;
              setState(() {});
            },
            child: const Text('重置'),
          )
        ],
      );
    }
    return ElevatedButton(
      onPressed: () {
        FilePicker.platform.pickFiles().then((value) async {
          final filepath = value?.paths.first;
          if (filepath != null) {
            final file = File(filepath);
            controller = VideoPlayerController.file(file);
            await controller?.initialize();
            controller!.play();
            setState(() {});
            }
        });
        // hh
      },
      child: const Text('选择视频文件'),
    );
  }
}