import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/news_detalis_page.dart';
import 'package:flutter_application_1/model/news_item.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomCursorlSlider extends StatefulWidget {
  final List<NewsItem> newss;
  const CustomCursorlSlider({super.key, required this.newss});

  @override
  State<CustomCursorlSlider> createState() => _CustomCursorlSliderState();
}

class _CustomCursorlSliderState extends State<CustomCursorlSlider> {
  String getElapsedTime(DateTime pastTime) {
    DateTime now = DateTime.now().toUtc();

    Duration difference = now.difference(pastTime);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} dakika önce";
    } else {
      return "${difference.inHours} saat önce";
    }
  }

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders =
        widget.newss
            .map(
              (item) => Container(
                margin: const EdgeInsets.all(5.0),

                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        item.image,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error, size: 50),
                      ),

                      Positioned(
                        top: 15,
                        left: 15,

                        child: Container(
                          alignment: Alignment.center,
                          width: 85,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.source,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${item.source}  •  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    getElapsedTime(item.date),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              child: Text(
                                item.name.length > 50
                                    ? '${item.name.substring(0, 50)}...'
                                    : item.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList();

    return Column(
      children: [
        InkWell(
          onTap:
              () => {
                Get.to(() => NewsDetalisPage(newsItem: widget.newss[_current])),
              },
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.newss.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: entry.key == _current ? 30.0 : 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape:
                          _current == entry.key
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                      borderRadius:
                          _current == entry.key
                              ? BorderRadius.circular(10.0)
                              : null,
                      color: (entry.key == _current ? Colors.blue : Colors.grey)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
