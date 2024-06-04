// ignore_for_file: dead_code, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app_project/main.dart';

import 'package:news_app_project/models/news_model.dart';
import 'package:news_app_project/pages/category_page.dart';
import 'package:news_app_project/pages/news_page.dart';
// import 'package:news_app_project/services/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app_project/models/slider.dart';
import 'package:news_app_project/pages/news_page_web.dart';
import 'package:news_app_project/services/news.dart';
import 'package:news_app_project/services/slider_date.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(const MyApp());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<newsModel> news = [];
  List<slideModel> sliders = [];
  bool cont = true;
  bool cont2 = true;
  int actIndex = 0;

  @override
  void initState() {
    super.initState();
    // categories = getCategories();
    getSlider();
    super.initState();
    getNews();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    news = newsclass.news;
    setState(() {
      cont = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      cont2 = false;
    });
  }

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/indir.png"), //logo
                  height: 40,
                  width: 40,
                ),
                Text(
                  "News", //isim
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 165, 245),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                )
              ],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0, //gölgelenme kaldırmak için kullanılıyor
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg", //logo,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 1.0,
                    left: 4.0,
                    child: Column(
                      children: [
                        Text(
                          "News", //isim
                          style: TextStyle(
                            color: Color.fromARGB(255, 66, 165, 245),
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "Categories",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.money_outlined),
              title: const Text("Currency"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => newsPageWeb(
                            url: 'https://www.tcmb.gov.tr/kurlar/today.xml',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text("General"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'General',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text("Business"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'Business',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.party_mode_sharp),
              title: const Text("Entertainment"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'Entertainment',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.heart_broken),
              title: const Text("Health"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'Health',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.science),
              title: const Text("Science"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'Science',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text("Technology"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'Technology',
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_football),
              title: const Text("Sports"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categoryPage(
                            catName: 'Sports',
                          )),
                );
              },
            ),
          ],
        ),
      ),
      body: cont && cont2
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("")],
                        ),
                      ),
                      CarouselSlider.builder(
                        //https://pub.dev/packages/carousel_slider/install
                        itemCount: 7,
                        itemBuilder: (context, index, realIndex) {
                          return imgSlide(
                            title: sliders[index].title!,
                            imageurl: sliders[index].urlToImage!,
                            url1: sliders[index].url!,
                            des: sliders[index].description!,
                          );
                        },
                        options: CarouselOptions(
                            //https://pub.dev/packages/carousel_slider/install
                            height: 240,
                            viewportFraction:
                                1, //tasarımaçısından kaldırılabilir fakat yazı kısımı kauıyor
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) {
                              setState(() {
                                actIndex = index;
                              });
                            }),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      indicator(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: news.length,
                          itemBuilder: (BuildContext context, index) {
                            return pageTile(
                              title: news[index].title!,
                              imageurl: news[index].urlToImage!,
                              url1: news[index].url!,
                              des: news[index].description!,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  indicator() {
    return AnimatedSmoothIndicator(
      //https://pub.dev/packages/smooth_page_indicator/install
      activeIndex: actIndex,
      count: 7,
      effect: CustomizableEffect(
          /////burada direkt WormEffect() kullanılabilir bu
          activeDotDecoration: DotDecoration(
            width: 32,
            height: 12,
            color: Colors.blue,
            rotationAngle: 180,
            verticalOffset: -10,
            borderRadius: BorderRadius.circular(24),
            dotBorder: const DotBorder(
              padding: 2,
              width: 2,
              color: Colors.blue,
            ),
          ),
          dotDecoration: const DotDecoration(
            width: 24,
            height: 12,
            color: Colors.grey,
            dotBorder: DotBorder(
              padding: 2,
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            verticalOffset: 0,
          )),
    );
  }

  ///kullanılmak zorundaaa değilllllllllllllllllll hatta kullanılmaması dha iyi
}

// ignore: camel_case_types
class pageTile extends StatelessWidget {
  final String imageurl, title, url1, des;

  // ignore: use_key_in_widget_constructors
  const pageTile(
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

// ignore: camel_case_types
class imgSlide extends StatelessWidget {
  final String imageurl, title, url1, des;

  // ignore: use_key_in_widget_constructors
  const imgSlide(
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 250,
                child: CachedNetworkImage(
                  imageUrl: imageurl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Container(
                height: 250,
                padding: const EdgeInsets.only(left: 15),
                margin: const EdgeInsets.only(top: 145),
                width: MediaQuery.of(context).size.width - 20,
                decoration: const BoxDecoration(color: Colors.black45),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




// // *********** category tile olarak yapılan görselli kategoriler.
//// class CategoryTitle extends StatelessWidget {
// // //   // ignore: prefer_typing_uninitialized_variables
// // //   final image, categoryName;
// // //   // ignore: use_key_in_widget_constructors
// // //   const CategoryTitle({this.categoryName, this.image});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       margin: const EdgeInsets.only(bottom: 15),
// // //       child: Stack(
// // //         children: [
// // //           //cliprrect radius vermek için
// // //           //kategori seçim kısımı
// // //           ClipRRect(
// // //             borderRadius: const BorderRadius.all(Radius.circular(15)),
// // //             child: Image.asset(
// // //               image,
// // //               width: 150,
// // //               height: 60,
// // //               fit: BoxFit.fill,
// // //             ),
// // //           ),
// // //           Container(
// // //             width: 150,
// // //             height: 60,
// // //             decoration: BoxDecoration(
// // //               borderRadius: BorderRadius.circular(15),
// // //               color: Colors.black45,
// // //             ),
// // //             child: Center(
// // //               child: Text(
// // //                 categoryName,
// // //                 style: const TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 17,
// // //                     fontWeight: FontWeight.w500),
// // //               ),
// // //             ),
// // //           )
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// ListTile(    ********* bu da drawer kısmında kullanılabilir.........
//                 title: Container(
//                   margin: const EdgeInsets.only(left: 15),
//                   height: MediaQuery.of(context).size.height - 100,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     padding: const EdgeInsets.only(top: 20),
//                     scrollDirection: Axis.vertical,
//                     itemCount: categories.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return CategoryTitle(
//                         image: categories[index].image,
//                         categoryName: categories[index].categoryName,
//                       );
//                     },
//                   ),
//                 ),
//               ),


// // // // // // gesture detector olmadan yapılan  kayan görseller. 

// // // Widget imageSlider(String image, int index, String name) {
// // //     return Container(
// // //       margin: const EdgeInsets.symmetric(horizontal: 5.0),
// // //       child: Stack(
// // //         children: [
// // //           ClipRRect(
// // //             borderRadius: BorderRadius.circular(15),
// // //             child: Container(
// // //               height: 250,
// // //               child: CachedNetworkImage(
// // //                 imageUrl: image,
// // //                 fit: BoxFit.fill,
// // //                 width: MediaQuery.of(context).size.width - 20,
// // //               ),
// // //             ),
// // //           ),
// // //           ClipRRect(
// // //             borderRadius: const BorderRadius.only(
// // //                 bottomLeft: Radius.circular(15),
// // //                 bottomRight: Radius.circular(15)),
// // //             child: Container(
// // //               height: 250,
// // //               padding: const EdgeInsets.only(left: 15),
// // //               margin: const EdgeInsets.only(top: 145),
// // //               width: MediaQuery.of(context).size.width - 20,
// // //               decoration: const BoxDecoration(color: Colors.black54),
// // //               child: Padding(
// // //                 padding: const EdgeInsets.all(10),
// // //                 child: Text(
// // //                   name,
// // //                   maxLines: 2,
// // //                   style: const TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 20,
// // //                     fontWeight: FontWeight.w500,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           )
// // //         ],
// // //       ),
// // //     );
// // //   }




//   ####################### katergori sırası #############################
//  Container(
//                         margin: const EdgeInsets.only(left: 15),
//                         height: 80,
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.horizontal,
//                           itemCount: categories.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return CategoryTitle(
//                               image: categories[index].image,
//                               categoryName: categories[index].categoryName,
//                             );
//                           },
//                         ),
//                       ),



