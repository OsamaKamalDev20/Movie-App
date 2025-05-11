import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class ClassicMoviesServices {
  static const String classicMoviesUrl =
      "https://api.sampleapis.com/movies/classic";

  static Future<List<dynamic>> fetchClassicMovies() async {
    try {
      final response = await http.get(Uri.parse(classicMoviesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed to load classic movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
