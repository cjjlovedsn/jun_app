import 'package:go_router/go_router.dart';
import 'package:jun_app/pages/home.dart';
import 'package:jun_app/pages/webview_screen.dart';
import 'package:jun_app/pages/ytb_downloader.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'ytb_downloder',
          name: 'ytbDownloader',
          builder: (context, state) => const YtbDownloader(),
        ),
        GoRoute(
          path: 'web',
          name: 'web',
          builder: (context, state) => WebviewScreen(uri: state.uri.queryParameters['url'],),
        ),
      ],
    ),
  ],
);
