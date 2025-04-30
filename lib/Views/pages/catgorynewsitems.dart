import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/news_detalis_page.dart';
import 'package:flutter_application_1/Views/widgets/recommendation_item.dart';
import 'package:flutter_application_1/controller/get.dart';
import 'package:flutter_application_1/model/news_item.dart';

class categorynewsitem extends StatefulWidget {
  final cat;
  const categorynewsitem({super.key, required this.cat});

  @override
  State<categorynewsitem> createState() => _CategorynewsitemState();
}

class _CategorynewsitemState extends State<categorynewsitem> {
  List<NewsItem> list = [];
  bool datageldi = true;

  @override
  void initState() {
    super.initState();
    Getd().getnews(widget.cat).then((value) {
      setState(() {
        list = value;
        datageldi = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          datageldi
              ? Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Waiting_Card(),
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10),
                      itemCount: 5,
                    ),
                  ),
                ],
              )
              : SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Column(
                        children:
                            list
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
              ),
    );
  }
}

class Waiting_Card extends StatelessWidget {
  const Waiting_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Seklton(width: 160, height: 160),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Seklton(width: 100, height: 20),
            SizedBox(height: 10),
            Seklton(width: 222, height: 80),
            SizedBox(height: 5),
            Row(
              children: [
                Seklton(width: 80, height: 20),
                SizedBox(width: 2),
                Seklton(width: 20, height: 20),
                SizedBox(width: 2),
                Seklton(width: 80, height: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Seklton extends StatelessWidget {
  const Seklton({super.key, this.width, this.height});
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
