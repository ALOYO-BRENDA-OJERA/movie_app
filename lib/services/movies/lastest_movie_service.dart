import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movies/latest.dart';

class MovieService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2RlYmMyYjBjMDc1OTdjODQ3OTU3Yjk5ZWZjZWFjNyIsIm5iZiI6MTczOTQ1MzY0MC45LCJzdWIiOiI2N2FkZjRjOGFiZTc3Y2E0N2EzNmY0NjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qcNUkNdb4_zm49O-EFX66eshQ7d7ozvtffiuHgIGZcs';
  static const String bearerToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2RlYmMyYjBjMDc1OTdjODQ3OTU3Yjk5ZWZjZWFjNyIsIm5iZiI6MTczOTQ1MzY0MC45LCJzdWIiOiI2N2FkZjRjOGFiZTc3Y2E0N2EzNmY0NjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qcNUkNdb4_zm49O-EFX66eshQ7d7ozvtffiuHgIGZcs';

  Future<List<LatestMovie>> getNowPlayingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/now_playing'),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((movieData) => LatestMovie.fromJson(movieData)).toList();
      } else {
        throw Exception('Failed to fetch now playing movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting now playing movies: $e');
    }
  }

  Future<List<LatestMovie>> getPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/popular'),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((movieData) => LatestMovie.fromJson(movieData)).toList();
      } else {
        throw Exception('Failed to fetch popular movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting popular movies: $e');
    }
  }
}
