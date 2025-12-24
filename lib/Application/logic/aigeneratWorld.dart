// ignore: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lorewaver/Application/logic/WorldPrompt.dart';
import 'package:lorewaver/Presentation/Screens/WorldGeneratedScreen.dart';

class AiGenerateWorld {
  static const String _apiKey = 'AIzaSyCkGqeBTxt0mdG7t3bK_5LtHrtg9obf0uo';
  static const String _url = 'https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent';

  static Future<WorldData> generate() async {
    try {
      final prompt = WorldPrompt.prompt();
      debugPrint('Generating world with prompt: $prompt');

      final response = await http.post(
        Uri.parse('$_url?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': 'You are a creative world-building assistant. Return ONLY a valid JSON object. $prompt'}
              ]
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['candidates'] == null || (data['candidates'] as List).isEmpty) {
          throw Exception('No candidates returned from AI');
        }

        final String contentText = data['candidates'][0]['content']['parts'][0]['text'];
        final cleanJson = contentText.replaceAll('```json', '').replaceAll('```', '').trim();
        final Map<String, dynamic> json = jsonDecode(cleanJson);

        return (
          name: json['name']?.toString(),
          description: json['description']?.toString(),
          highlights: json['highlights']?.toString(),
          characters: json['stats']?['characters']?.toString(),
          eras: json['stats']?['eras']?.toString(),
        );
      }
      debugPrint('AI Generation failed: ${response.statusCode} - ${response.body}');
    } catch (e) {
      debugPrint('Error generating world: $e');
    }

    return (
      name: "Eldoria (Offline)",
      description: "A fallback world generated because the AI service was unreachable.",
      highlights: "Check your API key and internet connection.",
      characters: "10",
      eras: "5",
    );
  }
}
