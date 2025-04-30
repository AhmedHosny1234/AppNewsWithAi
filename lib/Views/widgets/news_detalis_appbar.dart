import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/widgets/app_bar_icons.dart';
import 'package:flutter_application_1/controller/localdata.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/model/news_item.dart';
import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';

class NewsDetalisAppbar extends StatefulWidget {
  final NewsItem newsItem;

  const NewsDetalisAppbar({super.key, required this.newsItem});

  @override
  State<NewsDetalisAppbar> createState() => _NewsDetalisAppbarState();
}

class _NewsDetalisAppbarState extends State<NewsDetalisAppbar> {
  Local_Data_Controller asw = Get.find();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 12, 46, 80),
      expandedHeight: mq.height * 0.4,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Appbaricon(icon: Icons.chevron_left, iconsSize: 35),
        ),
      ),
      leadingWidth: 50,
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.newsItem.isfavi = !widget.newsItem.isfavi;
              asw.addNews(widget.newsItem);
              asw.update();
            });
          },
          child: Appbaricon(
            icon: Icons.bookmark,
            iconsSize: 30,
            color: widget.newsItem.isfavi ? Colors.blue : Colors.white,
          ),
        ),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () async {
            Share.share('${widget.newsItem.url} ${'share'.tr}');
          },
          child: Appbaricon(icon: Icons.share, iconsSize: 30),
        ),
        SizedBox(width: 30),
      ],
      iconTheme: IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(widget.newsItem.image, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(30, 0, 0, 0),
                ),
              ),
            ),

            Positioned(
              bottom: 30,
              left: 15,
              right: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        widget.newsItem.source,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: mq.width,
                    child: Text(
                      widget.newsItem.name.length > 65
                          ? '${widget.newsItem.name.substring(0, 65)} ...'
                          : widget.newsItem.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${widget.newsItem.source}  •  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        getElapsedTime(widget.newsItem.date),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      pinned: true,

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(
          height: 25,
          width: mq.width,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}
