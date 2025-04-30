import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/news_detalis_page.dart';
import 'package:flutter_application_1/Views/widgets/recommendation_item.dart';
import 'package:flutter_application_1/controller/localdata.dart';

import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Local_Data_Controller>(
        init: Local_Data_Controller(localStorage: localStorage),
        builder:
            (controller) => Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children:
                            controller.news_local
                                .map(
                                  (newsItem) => InkWell(
                                    onTap:
                                        () => {
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => NewsDetalisPage(
                                                    newsItem: newsItem,
                                                  ),
                                            ),
                                          ),
                                        },
                                    child: RecommendationItem(
                                      newsItem: newsItem,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
