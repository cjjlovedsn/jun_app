import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jun_app/helpers/logger.dart';
import 'package:logger/web.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:http/http.dart' as http;

class UserAgentClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // request.headers['cookie'] = ''
    return http.Client().send(request);
  }
}

class YtbDownloader extends StatefulWidget {
  const YtbDownloader({Key? key}) : super(key: key);

  @override
  State<YtbDownloader> createState() => _YtbDownloaderState();
}

class _YtbDownloaderState extends State<YtbDownloader> {
  final controller = TextEditingController(text: 'https://www.youtube.com/watch?v=HRdvcYTBHNc');
  final yt = YoutubeExplode();

  Future<void> download() async {
    final video = await yt.videos.get(controller.text);
    // final manifest = await yt.videos.streamsClient.getManifest(video.id);
    // final streamInfo = manifest.audioOnly.first;
    // final stream = yt.videos.streamsClient.get(streamInfo);
    logger.d(video.title);
  }

  getPage() async {
    try {
      
    final response = await http.get(Uri.parse('https://www.youtube.com/watch?v=HRdvcYTBHNc'));
    logger.d(response);
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  void dispose() {
    yt.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube Downloader'),
        leading: IconButton(onPressed: () {
          context.pop();
        }, icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    download().catchError((e) {
                      Logger().e(e);
                    });
                    // getPage();
                  },
                  child: const Text('Download'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
