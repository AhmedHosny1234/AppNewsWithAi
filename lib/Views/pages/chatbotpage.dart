import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/widgets/messagecard.dart';
import 'package:flutter_application_1/controller/chatcontroller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class Chatbotpage extends StatefulWidget {
  final String Haber;
  const Chatbotpage({super.key, required this.Haber});

  @override
  State<Chatbotpage> createState() => _ChatbotpageState();
}

class _ChatbotpageState extends State<Chatbotpage> {
  final _c = Chatcontroller();
  @override
  void initState() {
    super.initState();
    _c.TextC.text = widget.Haber;
    _c.Ask();
    _c.TextC.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot".tr), centerTitle: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _c.TextC,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "message".tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () {
                    _c.Ask();
                    FocusScope.of(context).unfocus();
                    _c.TextC.clear();
                  },
                  icon: const Icon(Icons.send, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Center(
          child: Obx(
            () => ListView(
              controller: _c.scrollController,
              physics: const BouncingScrollPhysics(),
              children:
                  _c.list.map((e) {
                    return Messagecard(message: e);
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
