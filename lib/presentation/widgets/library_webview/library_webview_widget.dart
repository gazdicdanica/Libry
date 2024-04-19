import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/navigation_controls.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
        centerTitle: false,
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: SafeArea(
        child: WebViewStack(controller: controller),
      ),
    );
  }
}
