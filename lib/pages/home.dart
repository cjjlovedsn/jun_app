import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Youtube Downloader"),
            onTap: () {
              context.goNamed('ytbDownloader');
            },
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
          ListTile(
            title: const Text("Open Youtube"),
            onTap: () {
              context.go('/web?url=https://youtube.com/watch?v=HRdvcYTBHNc&bpctr=99999999999&hl=en');
            },
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}