import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/chatbotpage.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/news_item.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetalisBody extends StatelessWidget {
  final NewsItem news_item;
  const NewsDetalisBody({super.key, required this.news_item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            news_item.source,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).textColor,
            ),
          ),
        ),
        SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            news_item.description,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 10),

        TextButton(
          onPressed: () {
            launchUrl((Uri.parse(news_item.url)));
          },
          child: Text(
            news_item.url,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Chatbotpage(Haber: news_item.description));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isDarkMode1 ? Colors.white : Colors.black,
                  ),
                ),
                child: Text(
                  "Ask".tr,
                  style: TextStyle(
                    color: isDarkMode1 ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
