import 'dart:convert';
import 'package:http/http.dart' as http;

class AIChatService {
  static const String _apiKey = 'AIzaSyCv1T3GR0fU0SSRuLvmeQLJsSAwmqQ8WKc';
  static const url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$_apiKey';

  static Future<String> askGemini(String prompt) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String text = data["candidates"][0]["content"]["parts"][0]["text"];

      // إزالة النجوم من الإجابات
      text = text.replaceAll('*', '').trim();

      return text;
    } else {
      print('❌ Status: ${response.statusCode}');
      print('❌ Body: ${response.body}');
      return "حدث خطأ أثناء التواصل مع Gemini.";
    }
  }

  static Future<List<Map<String, dynamic>>> fetchFootballQuiz() async {
    const prompt = '''
أعطني 10 أسئلة اختيار من متعدد عن كأس العالم. كل سؤال يحتوي على 4 خيارات، وحدد الإجابة الصحيحة بشكل واضح بهذه الصيغة:
1. [السؤال]
أ. [خيار 1]
ب. [خيار 2]
ج. [خيار 3]
د. [خيار 4]
الإجابة الصحيحة: [الحرف]''';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final text = jsonDecode(response.body)["candidates"][0]["content"]
          ["parts"][0]["text"];
      return _parseQuestions(text);
    } else {
      print('❌ خطأ في الاتصال بـ Gemini: ${response.statusCode}');
      return [];
    }
  }

  static List<Map<String, dynamic>> _parseQuestions(String text) {
    final List<Map<String, dynamic>> parsed = [];
    final blocks = text.trim().split("\n\n");
    for (var block in blocks) {
      final lines = block.trim().split("\n");
      if (lines.length >= 6) {
        final qText = lines[0].substring(3).replaceAll('*', '').trim();
        final options = [
          lines[1].substring(2).replaceAll('*', '').trim(),
          lines[2].substring(2).replaceAll('*', '').trim(),
          lines[3].substring(2).replaceAll('*', '').trim(),
          lines[4].substring(2).replaceAll('*', '').trim(),
        ];

        final correctLetter = lines[5].trim().substring(lines[5].length - 1);
        final index = ['أ', 'ب', 'ج', 'د'].indexOf(correctLetter);
        if (index != -1) {
          parsed.add({
            'question': qText,
            'options': options,
            'correctAnswer': options[index],
          });
        }
      }
    }
    return parsed;
  }
}
