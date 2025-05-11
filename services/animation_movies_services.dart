import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class AnimationMoviesServices {
  static const String animatedMoviesUrl =
      "https://api.sampleapis.com/movies/animation";

  static Future<List<dynamic>> fetchAnimatedMovies() async {
    try {
      final response = await http.get(Uri.parse(animatedMoviesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed to load animated movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
