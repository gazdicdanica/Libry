import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/error_screen_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, super.key, required this.url});
  final WebViewController controller;
  final String url;
  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  bool hasError = false;
  bool isFirstLoad = true;
  @override
  void initState() {
    super.initState();

    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          if (mounted) {
            setState(() {
              loadingPercentage = 0;
              hasError = false;
            });
          }
        },
        onProgress: (progress) {
          if (mounted) {
            setState(() {
              loadingPercentage = progress;
            });
          }
        },
        onPageFinished: (url) {
          if (mounted) {
            setState(() {
              loadingPercentage = 100;
            });
          }
        },
        onWebResourceError: (error) {
          if (mounted) {
            setState(() {
              hasError = true;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
        ),
        if (hasError)
          ErrorScreen(
            errorMessage: t.internet_error,
            refreshFunction: () {
              setState(() {
                hasError = false;
              });
              if (Platform.isIOS) {
                widget.controller.loadRequest(Uri.parse(widget.url));
                isFirstLoad = false;
                widget.controller.reload();
              } else if (Platform.isAndroid) {
                widget.controller.reload();
              }
            },
          ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
