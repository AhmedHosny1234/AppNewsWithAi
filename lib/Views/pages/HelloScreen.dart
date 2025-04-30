import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/custom_bottom_nav_bar.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/globel/pref.dart';

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Helloscreen extends StatefulWidget {
  const Helloscreen({super.key});

  @override
  State<Helloscreen> createState() => _HelloscreenState();
}

class _HelloscreenState extends State<Helloscreen> {
  Set<String> selectedItems = {};

  void toggleSelection(String name) {
    setState(() {
      if (selectedItems.contains(name)) {
        selectedItems.remove(name);
      } else {
        selectedItems.add(name);
      }
    });
  }

  String selectedLanguage = "English";
  String selectedFlag = "🇺🇸";

  final List<Map<String, String>> languages = [
    {"name": "English", "flag": "🇺🇸"},
    {"name": "Türkçe", "flag": "🇹🇷"},
  ];

  final PageController controller = PageController();
  bool isEnglish = true;
  bool isLast = false;
  Timer? _timer;
  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        isEnglish = !isEnglish;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLast = index == 2;
            });
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Lottie.asset('assets/lottie/2.json', height: mq.height * 0.35),
                SizedBox(height: mq.height * 0.03),
                Text(
                  "Özetle",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: mq.height * 0.05),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder: (widget, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0.0, 0.5),
                          end: Offset.zero,
                        ).animate(animation),
                        child: widget,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 100,
                      child: Text(
                        isEnglish
                            ? "Özetle is a news summarization app that collects news from reliable sources and uses AI to generate concise summaries based on user interests."
                            : "Özetle, güvenilir kaynaklardan haber toplayıp yapay zeka ile kullanıcı ilgisine göre özetler oluşturan bir haber özetleme uygulamasıdır.",
                        key: ValueKey(isEnglish),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SmoothPageIndicator(controller: controller, count: 3),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                Lottie.asset('assets/lottie/4.json', height: mq.height * 0.35),
                SizedBox(height: mq.height * 0.03),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  transitionBuilder: (widget, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0.0, 0.5),
                          end: Offset.zero,
                        ).animate(animation),
                        child: widget,
                      ),
                    );
                  },
                  child: Text(
                    isEnglish
                        ? "Please select your preferred language"
                        : "Lütfen tercih ettiğiniz dili seçin",
                    key: ValueKey(isEnglish),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: mq.height * 0.05),
                DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                      selectedFlag =
                          languages.firstWhere(
                            (lang) => lang["name"] == newValue,
                          )["flag"]!;
                      Pref.language = newValue == "English" ? "en" : "tr";
                    });
                  },
                  items:
                      languages.map((lang) {
                        return DropdownMenuItem<String>(
                          value: lang["name"],
                          child: Row(
                            children: [
                              Text(
                                lang["flag"]!,
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(width: 10),
                              Text(
                                lang["name"]!,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: mq.height * 0.19),
                SmoothPageIndicator(controller: controller, count: 3),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                Spacer(),
                Lottie.asset('assets/lottie/3.json', height: mq.height * 0.35),
                SizedBox(height: 5),
                Text(
                  selectedLanguage == "English"
                      ? "Please select your interests"
                      : "Lütfen ilgi alanlarınızı seçin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children:
                      Category_list.map((item) {
                        final String name =
                            selectedLanguage == "English"
                                ? item["name"]
                                : item["name_tr"];
                        final IconData icon = item["icon"];
                        final String value = item["name"];
                        final bool isSelected = selectedItems.contains(value);
                        return GestureDetector(
                          onTap: () => toggleSelection(value),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.blue : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  icon,
                                  size: 40,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
                const Spacer(),
                SmoothPageIndicator(controller: controller, count: 3),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            if ((controller.page)!.toInt() == 1) {
              Get.snackbar(
                selectedLanguage == "English"
                    ? "Language Changed"
                    : "Dil Değiştirildi",

                selectedLanguage == "English"
                    ? "Language changed to $selectedLanguage"
                    : "Dil $selectedLanguage olarak değiştirildi",
                snackPosition: SnackPosition.TOP,
              );
            }
            isLast
                ? {
                  if (selectedItems.isEmpty)
                    {
                      Get.defaultDialog(
                        title:
                            selectedLanguage == "English" ? "Alert " : "Uyarı",
                        content: Text(
                          style: TextStyle(fontSize: 18),
                          selectedLanguage == "English"
                              ? "If you do not specify your interests, it will be automatically set to general"
                              : "Eğer ilgi alanlarınızı belirlemezseniz, otomatik olarak genel olacaktır",
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              selectedLanguage == "English"
                                  ? "İptal "
                                  : "Cancel",
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomBottomNavBar(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              selectedLanguage == "English"
                                  ? "OK "
                                  : "Onaylıyorum",
                            ),
                          ),
                        ],
                      ),
                    }
                  else
                    {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomBottomNavBar(),
                        ),
                      ),
                    },

                  Pref.selectedItems = selectedItems.toList(),
                }
                : controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          child: Text(isLast ? 'Get Started' : 'Next'),
        ),
      ),
    );
  }
}
