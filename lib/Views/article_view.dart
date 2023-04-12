import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AtricleView extends StatefulWidget {
  String blogurl;
  AtricleView({super.key, required this.blogurl});

  @override
  State<AtricleView> createState() => _AtricleViewState();
}

class _AtricleViewState extends State<AtricleView> {
  late InAppWebViewController webview;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Today',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(widget.blogurl),
        ),
        onWebViewCreated: ((InAppWebViewController webViewController) {
          webview = webViewController;
        }),
      ),
    );
  }
}
