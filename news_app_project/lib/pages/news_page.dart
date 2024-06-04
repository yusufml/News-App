// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:news_app_project/pages/news_page_web.dart';

// Import for Android features.

// ignore: must_be_immutable
class newsPage extends StatefulWidget {
  String url, title, imgUrl, descrip;
  // ignore: use_key_in_widget_constructors
  newsPage(
      {required this.url,
      required this.title,
      required this.imgUrl,
      required this.descrip});

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 1),
          child: Column(children: [
            CachedNetworkImage(
              imageUrl: widget.imgUrl,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            Text(
              widget.descrip,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue.withOpacity(0.04);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.12);
                      }
                      return null; // https://docs.flutter.dev/release/breaking-changes/buttons
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => newsPageWeb(
                              url: widget.url,
                            )),
                  );
                },
                child: const Text(
                  'Web Sitesine Git',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ]),
        ),
      ),
    );
  }
}
