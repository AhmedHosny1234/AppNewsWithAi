import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:get/get.dart';

class Messagecard extends StatelessWidget {
  final Message message;
  const Messagecard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.type == MessageType.user
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: mq.width * 0.75),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                message.type == MessageType.user
                    ? Colors.blue
                    : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              message.msg.isEmpty
                  ? AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "wait".tr,
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color:
                              message.type == MessageType.user
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  )
                  : Text(
                    message.msg,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color:
                          message.type == MessageType.user
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
        ),
      ],
    );
  }
}
