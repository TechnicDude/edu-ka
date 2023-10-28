import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreensShow extends StatefulWidget {
  final String url;
  WebViewScreensShow({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreensShow> createState() => _WebViewScreensShowState();
}

class _WebViewScreensShowState extends State<WebViewScreensShow> {
  var loadingPercentage = 0;
  late final WebViewController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (loadingPercentage < 100)
          Center(
            child: CircularProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
          ),
      ],
    );
  }
}
