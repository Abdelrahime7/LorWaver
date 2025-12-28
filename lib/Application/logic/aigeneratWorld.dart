// ignore: file_names
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:lorewaver/Application/logic/WorldPrompt.dart';
import 'package:lorewaver/Presentation/Screens/WorldGeneratedScreen.dart';

class AiGenerateWorld {
  static String get _apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
  static const String _url = 'https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent';

  static Future<WorldData> generate() async {
    // Ensure environment variables are loaded
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      // Proceed silently; this might happen if already loaded
    }

    try {
      final prompt = WorldPrompt.prompt();
    //  debugPrint('Generating world with prompt: $prompt');

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

        final mapDescription = json['map_description']?.toString() ?? 'fantasy world map';
        final seed = Random().nextInt(1000000);
        final mapImageUrl = 'https://image.pollinations.ai/prompt/${Uri.encodeComponent(mapDescription)}?width=1024&height=1024&nologo=true&seed=$seed';

        // Download the image immediately so it is ready when the UI shows
        Uint8List? mapImageBytes;
        try {
          final imageResponse = await http.get(Uri.parse(mapImageUrl));
          if (imageResponse.statusCode == 200) {
            mapImageBytes = imageResponse.bodyBytes;
          }
        } catch (e) {
          debugPrint('Failed to pre-download map image: $e');
        }

        return (
          name: json['name']?.toString(),
          description: json['description']?.toString(),
          highlights: json['highlights']?.toString(),
          characters: json['stats']?['characters']?.toString(),
          eras: json['stats']?['eras']?.toString(),
          mapImageUrl: mapImageUrl,
          mapImageBytes: mapImageBytes,
        );
      }
    //  debugPrint('AI Generation failed: ${response.statusCode} - ${response.body}');
    } catch (e) {
      debugPrint('Error generating world: $e');
    }

    return (
      name: "Eldoria (Offline)",
      description: "A fallback world generated because the AI service was unreachable.",
      highlights: "Check your API key and internet connection.",
      characters: "10",
      eras: "5",
      mapImageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDJW1SLLDlsn2euvmoTNSDn7o-hOWB0iNIFWYAkCimhFD-7bFoOzVKspIR39cE27EQLYID63HCEW7V7mQqbSktYEMA51cPvSTVJyi8vmrjMixn8BvhnPYme0zY5xg2wXFlW9XcxZWkMe1kZFJRcYG18_PH3dNojHL-PDOEtzCmhdYBeihTIzrIxLyBfO0VEp0bJ4cEuioRCObpOF-zD5zGmCndu0z9b8y4mCerqCAhv4wEqgVl0XWWSWbhILv-ZrLiRJcyOvIsohA",
      mapImageBytes: null,
    );
  }
}
