import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/widgets/News_detalis_body.dart';
import 'package:flutter_application_1/Views/widgets/news_detalis_appbar.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/model/news_item.dart';

class NewsDetalisPage extends StatelessWidget {
  final NewsItem newsItem;
  const NewsDetalisPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                NewsDetalisAppbar(newsItem: newsItem),

                SliverToBoxAdapter(child: NewsDetalisBody(news_item: newsItem)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
