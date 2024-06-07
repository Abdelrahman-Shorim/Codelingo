import 'package:http/http.dart' as http;
import 'package:codelingo/env/env.dart';
import 'request.model.dart';
import 'response.model.dart';
import 'package:flutter/foundation.dart';

class ChatService {
  static final Uri chatUri =
      Uri.parse('https://api.openai.com/v1/chat/completions');
  static String promptSystem =
      '''You are a helpful C++ quiz generator designed to output JSON in the format 
  {"question":"", "code":"", "options":{"A":"", "B":"", "C":"", "D":""}, "correct_answer":"","difficulty":"","topic":""},. 
  Only the code avriable is optional and no code in "question" all codes in "code", and if given multiple topics divide them on the number of questions as possible''';
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Env.openaiApiKey}',
  };

  Future<String?> request(
      {required String amount,
      required String difficulty,
      required String topic}) async {
    // int amount = 0;
    // String difficulty = '';
    // String topic = '';

    String prompt =
        "Generate {$amount} short and concise {$difficulty} level multiple-choice C++ programming question about {$topic}. Include options and question in and mark the correct answer.";
    try {
      ChatRequest request = ChatRequest(
          model: Env.modelId,
          maxTokens: 1000,
          temperature: 0.75,
          messages: [
            Message(role: "system", content: promptSystem),
            Message(role: "user", content: prompt)
          ]);
      if (prompt.isEmpty) {
        return null;
      }
      http.Response response = await http.post(
        chatUri,
        headers: headers,
        body: request.toJson(),
      );
      ChatResponse chatResponse = ChatResponse.fromResponse(response);
      //String? chatResponseContent = chatResponse.choices?[0].message?.content;
      //debugPrint("$amount, $difficulty,$topic");
      debugPrint(chatResponse.choices?[0].message?.content);
      return chatResponse.choices?[0].message?.content;
    } catch (e) {
      debugPrint("error $e");
    }
    return null;
  }
}

// if (_generatedPrompt != null)
//   Text(
//     _generatedPrompt!,
//     style:
//         const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   )