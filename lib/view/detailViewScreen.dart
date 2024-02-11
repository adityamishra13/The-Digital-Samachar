import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as FlutterWebView;

class DetailViewScreen extends StatefulWidget {
  final String newsUrl;

  DetailViewScreen({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  late FlutterWebView.WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("The Digital Samachar" , style: TextStyle(color: Colors.white,),),
      backgroundColor: Colors.blueGrey,


      ),
      body: FlutterWebView.WebView(
        initialUrl: widget.newsUrl,
        javascriptMode: FlutterWebView.JavascriptMode.unrestricted,
        onWebViewCreated: (FlutterWebView.WebViewController webViewController) {
          setState(() {
            _controller = webViewController;
          });
        },
      ),
    );
  }
}
