import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatGPT {
  String apiKey;

  ChatGPT({required this.apiKey});

  Future<String> generateText(String input) async {
    var url = Uri.parse('https://api.openai.com/v1/chat/completions');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    var body = json.encode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {"role": "user", "content": input}
      ],
      'temperature': 0.2,
    }).toString();
    debugPrint(body);
    var response = await http.post(url, headers: headers, body: body);
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      debugPrint(data['choices'][0]['message']['content']);
      var text = data['choices'][0]['message']['content'].toString();
      return text;
    } else {
      return 'how are you';
      //throw Exception('${response.statusCode} Failed to generate text');
    }
  }
}
