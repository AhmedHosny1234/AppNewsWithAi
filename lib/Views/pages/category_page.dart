import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/catgorynewsitems.dart';
import 'package:flutter_application_1/Views/widgets/category_items.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/globel/pref.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'cat'.tr,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),

          Wrap(
            children:
                Category_list.map((item) {
                  final String name =
                      Pref.language == "en_US" ? item["name"] : item["name_tr"];

                  final IconData icon = item["icon"];

                  return GestureDetector(
                    onTap:
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => categorynewsitem(
                                    cat: item["name"].toString().toLowerCase(),
                                  ),
                            ),
                          ),
                        },
                    child: CategoryItems(name: name, icon: icon),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
