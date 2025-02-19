import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
// import '../models/movie_lists/now_playing.dart';
import 'package:movie_app/models/movie_lists/now_playing.dart';





class MovieService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _bearerToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2RlYmMyYjBjMDc1OTdjODQ3OTU3Yjk5ZWZjZWFjNyIsIm5iZiI6MTczOTQ1MzY0MC45LCJzdWIiOiI2N2FkZjRjOGFiZTc3Y2E0N2EzNmY0NjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qcNUkNdb4_zm49O-EFX66eshQ7d7ozvtffiuHgIGZcs';

  Future<PlayingNowResponse> getNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/now_playing?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer $_bearerToken',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return PlayingNowResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }
}
