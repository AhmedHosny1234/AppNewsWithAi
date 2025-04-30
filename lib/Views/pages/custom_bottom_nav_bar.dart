import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/pages/HomeScreen.dart';
import 'package:flutter_application_1/Views/pages/aboutus.dart';
import 'package:flutter_application_1/Views/pages/category_page.dart';
import 'package:flutter_application_1/Views/pages/havadurumu.dart';
import 'package:flutter_application_1/Views/pages/namazpage.dart';

import 'package:flutter_application_1/Views/pages/saved.dart';
import 'package:flutter_application_1/Views/pages/settings.dart';

import 'package:flutter_application_1/Views/widgets/CustomSearchDelegate.dart';
import 'package:flutter_application_1/Views/widgets/app_bar_icons.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: SizedBox(
        width: 350,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 12, 46, 80),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/news.png',
                        width: 100,
                        height: 100,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: const Text(
                        'Özetle',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(const Havadurumu());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo,
                    ),

                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.cloud, color: Colors.white),
                        SizedBox(width: 25),
                        Text(
                          "Hava".tr,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const Namazpage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo,
                    ),

                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(width: 7),
                        Icon(
                          Icons.shield_moon_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(width: 25),
                        Text(
                          "Namaz".tr,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Get.to(const Settings());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo,
                    ),

                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(width: 7),
                        Icon(Icons.settings, color: Colors.white, size: 40),
                        SizedBox(width: 25),
                        Text(
                          "Settings".tr,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => Get.to(() => const Aboutus()),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo,
                    ),

                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.people, color: Colors.white),
                        SizedBox(width: 25),
                        Text(
                          "About".tr,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: const Appbaricon(icon: Icons.menu, color: Colors.black),
              ),
            );
          },
        ),
        actions: [
          GestureDetector(
            child: Appbaricon(icon: Icons.search, color: Colors.black),
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),

          SizedBox(width: 10),
          Appbaricon(icon: Icons.notifications, color: Colors.black),
          SizedBox(width: 27),
        ],
      ),
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: Homescreen(),
            item: ItemConfig(
              activeForegroundColor: Theme.of(context).navbar,
              icon: Icon(Icons.home),
              title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: Saved(),
            item: ItemConfig(
              activeForegroundColor: Theme.of(context).navbar,
              icon: Icon(Icons.inbox_rounded),
              title: "Saved",
            ),
          ),
          PersistentTabConfig(
            screen: CategoryPage(),

            item: ItemConfig(
              activeForegroundColor: Theme.of(context).navbar,
              icon: Icon(Icons.category),
              title: "Category",
            ),
          ),
        ],

        navBarBuilder:
            (navBarConfig) => Style8BottomNavBar(
              navBarDecoration: NavBarDecoration(
                color:
                    isDarkMode1
                        ? Colors.black
                        : Theme.of(context).scaffoldBackgroundColor,
              ),

              navBarConfig: navBarConfig,
            ),
      ),
    );
  }
}
