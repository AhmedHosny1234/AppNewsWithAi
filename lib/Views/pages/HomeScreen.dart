import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Views/pages/catgorynewsitems.dart';
import 'package:flutter_application_1/Views/pages/news_detalis_page.dart';

import 'package:flutter_application_1/Views/widgets/custom_cursorl_slider.dart';
import 'package:flutter_application_1/Views/widgets/recommendation_item.dart';
import 'package:flutter_application_1/controller/get.dart';
import 'package:flutter_application_1/globel/pref.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/news_item.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<NewsItem> list = [];
  List<NewsItem> list1 = [];

  bool datageldi = true;

  @override
  void initState() {
    super.initState();
    Pref.showHelloScreen = false;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Getd().getnews("general").then((value) {
      setState(() {
        list = value;
      });
    });

    Getd().getnews("world").then((value) {
      setState(() {
        list1 = value;
        datageldi = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          datageldi
              ? const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              )
              : SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Breaking".tr,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            categorynewsitem(cat: 'general'),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                overlayColor: Colors.blue,
                              ),

                              child: Text(
                                'View All'.tr,
                                style: TextStyle(
                                  color: Theme.of(context).textColor2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      CustomCursorlSlider(newss: list),
                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommendations'.tr,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            categorynewsitem(cat: 'world'),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                overlayColor: Colors.blue,
                              ),

                              child: Text(
                                'View All'.tr,
                                style: TextStyle(
                                  color: Theme.of(context).textColor2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ...list1
                          .take(3)
                          .map(
                            (newsItem) => InkWell(
                              onTap:
                                  () => {
                                    Get.to(
                                      () => NewsDetalisPage(newsItem: newsItem),
                                    ),
                                  },
                              child: RecommendationItem(newsItem: newsItem),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
    );
  }
}
