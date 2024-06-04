// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.

// ignore: must_be_immutable
class newsPageWeb extends StatefulWidget {
  String url;
  // ignore: use_key_in_widget_constructors
  newsPageWeb({
    required this.url,
  });

  @override
  State<newsPageWeb> createState() => _newsPageWebState();
}

class _newsPageWebState extends State<newsPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const SafeArea(
            //appbar üstünde bildirim kısımında başlatmak amaçlı, İhtiyaca göre kaldırılanilir.
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image(
                    image: AssetImage("images/indir.png"), //logo
                    height: 40,
                    width: 40,
                  ),
                ]),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
