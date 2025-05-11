import 'dart:convert';
import 'package:http/http.dart' as http;

// ====== SERVICES FILE ======
class FamilyMoviesServices {
  static const String familyMoviesUrl =
      "https://api.sampleapis.com/movies/family";

  static Future<List<dynamic>> fetchFamilyMovies() async {
    try {
      final response = await http.get(Uri.parse(familyMoviesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed to load family movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching movies: $error");
    }
  }
}
