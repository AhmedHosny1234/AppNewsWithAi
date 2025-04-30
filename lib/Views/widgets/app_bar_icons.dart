import 'package:flutter/material.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/main.dart';

class Appbaricon extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconsSize;
  final Color color;
  const Appbaricon({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconsSize = 25,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: iconsSize,
        color: isDarkMode1 ? Theme.of(context).iconcolor : color,
      ),
    );
  }
}
