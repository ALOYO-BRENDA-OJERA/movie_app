import 'dart:convert';
import 'package:http/http.dart' as http;
// import '../models/latest_movie.dart';
import 'package:movie_app/models/movies/latest.dart';

class MovieService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2RlYmMyYjBjMDc1OTdjODQ3OTU3Yjk5ZWZjZWFjNyIsIm5iZiI6MTczOTQ1MzY0MC45LCJzdWIiOiI2N2FkZjRjOGFiZTc3Y2E0N2EzNmY0NjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qcNUkNdb4_zm49O-EFX66eshQ7d7ozvtffiuHgIGZcs';

  Future<LatestMovie> getLatestMovie() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/latest?api_key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return latestMovieFromJson(response.body);
      } else {
        throw Exception('Failed to fetch latest movie. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting latest movie: $e');
    }
  }

  Future<List<LatestMovie>> getNowPlayingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'),
        headers: {
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
        Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'),
        headers: {
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
