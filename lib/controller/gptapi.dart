import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:http/http.dart';

class Api {
  final dio = Dio();

  Future<String> getAnswer(String QS) async {
    final s = Promet + QS;

    try {
      final res = await post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$AiApi',
        ),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": s},
              ],
            },
          ],
        }),
      );
      final json = jsonDecode(res.body);

      final reply = json["candidates"][0]["content"]["parts"][0]["text"].trim();

      return reply;
    } catch (e) {
      log(e.toString());
      return "Something went wrong please try again later";
    }
  }

  Future<String> getAnswer2(String QS) async {
    final s = Promet + QS;

    try {
      final res = await post(
        Uri.parse(
          'https://router.huggingface.co/sambanova/v1/chat/completions',
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $HuggingFace',
        },
        body: jsonEncode({
          "messages": [
            {"role": "user", "content": s},
          ],
          "max_tokens": 512,
          "model": "DeepSeek-V3-0324",
          "stream": false,
        }),
      );
      final json = jsonDecode(res.body);

      final reply = json['choices'][0]['message']['content'];

      log(reply.toString());
      return reply;
    } catch (e) {
      log(e.toString());
      return "Something went wrong please try again later";
    }
  }
}
