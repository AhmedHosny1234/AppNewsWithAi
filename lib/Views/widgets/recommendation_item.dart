import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/news_item.dart';

class RecommendationItem extends StatelessWidget {
  final NewsItem newsItem;
  const RecommendationItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(newsItem.image),
                fit: BoxFit.cover,
                onError:
                    (exception, stackTrace) =>
                        const Icon(Icons.error, size: 50),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsItem.source,
                style: TextStyle(
                  color: Colors.grey,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),

              Container(
                width: 220,
                child: Text(
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

                  newsItem.name.length > 100
                      ? newsItem.name.substring(0, 97) + "..."
                      : newsItem.name,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      '${newsItem.source}   •   ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      newsItem.date.toString().substring(0, 10),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
