import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class MysteryMoviesServices {
  static const String mysteryMoviesUrl =
      "https://api.sampleapis.com/movies/mystery";

  static Future<List<dynamic>> fetchMysteryMovies() async {
    try {
      final response = await http.get(Uri.parse(mysteryMoviesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed to load mystery movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
