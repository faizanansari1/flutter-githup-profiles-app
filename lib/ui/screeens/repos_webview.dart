import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReposWebview extends StatefulWidget {
  ReposWebview({Key key}) : super(key: key);

  @override
  _ReposWebviewState createState() => _ReposWebviewState();
}

@override
void initState() {
  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
}

class _ReposWebviewState extends State<ReposWebview> {
  @override
  Widget build(BuildContext context) {
    final repUrl = ModalRoute.of(context).settings.arguments;
    return WebView(initialUrl: repUrl);
  }
}
