import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Views/pages/custom_bottom_nav_bar.dart';
import 'package:flutter_application_1/controller/local_controller.dart';
import 'package:flutter_application_1/controller/localdata.dart';
import 'package:flutter_application_1/controller/notification.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/globel/local.dart';
import 'package:flutter_application_1/globel/pref.dart';
import 'package:flutter_application_1/Views/pages/HelloScreen.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Pref.inatialize();
  await FirebaseNotificationController.instance.init();
  await initLocalStorage();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocal_Controller());
    Get.put(Local_Data_Controller(localStorage: localStorage));
    return GetMaterialApp(
      themeMode: Pref.defaultTheme(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      locale: Locale(Pref.language),
      translations: Mylocal(),
      darkTheme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Pref.showHelloScreen ? Helloscreen() : CustomBottomNavBar(),
    );
  }
}

extension AppTheme on ThemeData {
  Color get textColor => isDarkMode1 ? Colors.white : Colors.black87;
  Color get textColor2 =>
      isDarkMode1 ? Colors.cyan.withOpacity(0.5) : Colors.blueAccent;

  Color get iconcolor => Colors.white.withOpacity(0.5);
  Color get navbar =>
      isDarkMode1 ? CupertinoColors.white : CupertinoColors.activeBlue;
}
