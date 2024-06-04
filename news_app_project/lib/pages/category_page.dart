import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/models/category.dart';

import 'package:news_app_project/pages/news_page.dart';
import 'package:news_app_project/services/data.dart';

// ignore: camel_case_types, must_be_immutable
class categoryPage extends StatefulWidget {
  String catName;
  categoryPage({required this.catName});

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  List<cateModel> categor = [];
  bool cont = true;
  @override
  void initState() {
    super.initState();
    getcate();
  }

  getcate() async {
    category categ = category();
    await categ.getcate(widget.catName);
    categor = categ.categories;
    setState(() {
      cont = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SafeArea(
            //appbar üstünde bildirim kısımında başlatmak amaçlı, İhtiyaca göre kaldırılanilir.
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  Text(
                    widget.catName, //isim
                    style: const TextStyle(
                      color: Color.fromARGB(255, 66, 165, 245),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const Image(
                    image: AssetImage("images/indir.png"), //logo
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0, //gölgelenme kaldırmak için kullanılıyor
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: categor.length,
            itemBuilder: (BuildContext context, index) {
              return cateTile(
                title: categor[index].title!,
                imageurl: categor[index].urlToImage!,
                url1: categor[index].url!,
                des: categor[index].description!,
              );
            },
          ),
        ));
  }
}

// ignore: camel_case_types
class cateTile extends StatelessWidget {
  final String imageurl, title, url1, des;

  // ignore: use_key_in_widget_constructors
  const cateTile(
      {required this.title,
      required this.imageurl,
      required this.url1,
      required this.des});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => newsPage(
                    title: title,
                    url: url1,
                    imgUrl: imageurl,
                    descrip: des,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: CachedNetworkImage(
                    imageUrl: imageurl,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width - 50,
                    height: 150,
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(top: 150),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
