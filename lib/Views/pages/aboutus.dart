import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'.tr)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'About'.tr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 40),
              Text(
                'This is a sample about us page.',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
