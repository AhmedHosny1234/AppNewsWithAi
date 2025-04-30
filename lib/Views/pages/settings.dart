import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/local_controller.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/globel/pref.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  MyLocal_Controller myLocalController = Get.find();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings".tr), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text("Mod".tr),
            trailing: Switch(
              activeColor: Colors.blue,
              activeTrackColor: Colors.blue.withOpacity(0.5),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: isDarkMode1,
              onChanged: (value) {
                setState(() {
                  isDarkMode1 = value;
                  Get.changeThemeMode(
                    isDarkMode1 ? ThemeMode.dark : ThemeMode.light,
                  );
                  Pref.isDarkMode = !Pref.isDarkMode;
                });
              },
            ),
          ),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text("Notifications".tr),
            trailing: Switch(
              activeColor: Colors.blue,
              activeTrackColor: Colors.blue.withOpacity(0.5),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            ),
          ),

          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                SizedBox(
                  width: mq.width - 40,
                  height: 250,

                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Pref.language != "en_US"
                                  ? Colors.white70
                                  : Colors.white,

                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 3.0),
                          ),
                        ),
                        child: ListTile(
                          minTileHeight: 65,
                          title: Text(
                            "Türkçe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // Handle language change to Turkish
                            myLocalController.changeLanguage("tr_TR");
                            Pref.language = "tr_TR";
                            Get.updateLocale(Locale("tr", "TR"));
                            Get.back(); // Close the bottom sheet
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),

                          color:
                              Pref.language != "en_US"
                                  ? Colors.white
                                  : Colors.white70,
                        ),
                        child: ListTile(
                          minTileHeight: 65,
                          title: Text(
                            "English",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // Handle language change to English
                            myLocalController.changeLanguage("en_US");
                            Pref.language = "en_US";
                            Get.updateLocale(Locale("en", "US"));
                            Get.back(); // Close the bottom sheet
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue,
                          ),

                          child: ListTile(
                            title: Text(
                              "Close".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Get.back(); // Close the bottom sheet
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // Navigate to the language settings page
            },
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Row(
                children: [
                  Text("Language".tr),
                  Padding(
                    padding: EdgeInsets.only(left: 170),
                    child: Text(
                      Pref.language == "en_US" ? "English" : "Türkçe",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
