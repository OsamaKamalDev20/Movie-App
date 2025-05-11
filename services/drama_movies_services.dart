import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class DramaMoviesServices {
  static const String dramaMoviesUrl =
      "https://api.sampleapis.com/movies/drama";

  static Future<List<dynamic>> fetchDramaMovies() async {
    try {
      final response = await http.get(Uri.parse(dramaMoviesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed to load comedy movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
