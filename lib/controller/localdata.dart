import 'dart:convert';

import 'package:flutter_application_1/model/news_item.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:localstorage/localstorage.dart';

class Local_Data_Controller extends GetxController {
  final LocalStorage localStorage;
  // List of expenses
  List<NewsItem> _news_local = [];

  Local_Data_Controller({required this.localStorage}) {
    _loadNewsFromStorage();
  }

  List<NewsItem> get news_local => _news_local;

  void _loadNewsFromStorage() async {
    var storedExpenses = localStorage.getItem('NewsItem');
    if (storedExpenses != null) {
      var decoded = jsonDecode(storedExpenses); // فك الترميز من String إلى JSON
      _news_local = List<NewsItem>.from(
        (decoded as List).map((item) => NewsItem.fromJson(item)),
      );
    }
  }

  void addNews(NewsItem newsItem) {
    _news_local.add(newsItem);
    _saveNewsToStorage();
  }

  void removeNews(NewsItem newsItem) {
    _news_local.remove(newsItem);
    _saveNewsToStorage();
  }

  void _saveNewsToStorage() {
    localStorage.setItem(
      'NewsItem',
      jsonEncode(_news_local.map((e) => e.toJson()).toList()),
    );
  }
}
