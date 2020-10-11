import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String blogUrl;
  ArticleView({this.blogUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.red),
            ),
                ],
              ),
            ),
            Icon(Icons.share)
          ],
        ),
        elevation: 0.0,
      ),
          body: Container(
            height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
              _completer.complete(webViewController);
          })),
      ),
    );
  }
}