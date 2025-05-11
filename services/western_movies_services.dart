import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class WesternMoviesServices {
  static const String westernMoviesUrl =
      "https://api.sampleapis.com/movies/western";

  static Future<List<dynamic>> fetchWesternMovies() async {
    try {
      final response = await http.get(Uri.parse(westernMoviesUrl));

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
