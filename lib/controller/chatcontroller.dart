import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/gptapi.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:get/get.dart';

class Chatcontroller extends GetxController {
  // Add your chat-related methods and properties here
  final TextC = TextEditingController();
  final scrollController = ScrollController();

  final list = <Message>[].obs;

  void Ask() async {
    if (TextC.text.trim().isNotEmpty) {
      list.add(Message(msg: TextC.text, type: MessageType.user));
      list.add(Message(msg: '', type: MessageType.bot));
      final res = await Api().getAnswer(TextC.text);

      list.removeLast();
      list.add(Message(msg: res, type: MessageType.bot));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
