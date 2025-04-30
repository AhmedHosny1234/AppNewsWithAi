import 'package:flutter/material.dart';
import 'package:flutter_application_1/globel/globel.dart';

class CategoryItems extends StatelessWidget {
  final String name;
  final IconData icon;
  const CategoryItems({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mq.height / 8,
        width: mq.width / 2 - 20,

        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color:
              isDarkMode1 ? Colors.white12 : Color.fromRGBO(235, 235, 240, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 55,

              color:
                  isDarkMode1 ? Colors.white70 : Color.fromRGBO(56, 56, 58, 1),
            ),
            const SizedBox(height: 10),
            Text(
              name,

              style: TextStyle(
                color:
                    isDarkMode1
                        ? Colors.white70
                        : Color.fromRGBO(56, 56, 58, 1),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
