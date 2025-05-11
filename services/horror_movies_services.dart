import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class HorrorMoviesServices {
  static const String horrorMoviesUrl =
      "https://api.sampleapis.com/movies/horror";

  static Future<List<dynamic>> fetchHorrorMovies() async {
    try {
      final response = await http.get(Uri.parse(horrorMoviesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed to load horror movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
