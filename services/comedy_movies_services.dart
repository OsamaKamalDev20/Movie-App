import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class ComedyMoviesServices {
  static const String comedyMoviesUrl =
      "https://api.sampleapis.com/movies/comedy";

  static Future<List<dynamic>> fetchComedyMovies() async {
    try {
      final response = await http.get(Uri.parse(comedyMoviesUrl));

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
