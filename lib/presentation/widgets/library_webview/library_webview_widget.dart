import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/navigation_controls.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_internship_2024_app/keys.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class LibraryWebView extends StatefulWidget {
  final String url;
  const LibraryWebView({super.key, required this.url});

  @override
  State<LibraryWebView> createState() => _LibraryWebViewState();
}

class _LibraryWebViewState extends State<LibraryWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: K.webView,
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: SafeArea(
        child: WebViewStack(
          controller: controller,
          url: widget.url,
        ),
      ),
    );
  }
}
