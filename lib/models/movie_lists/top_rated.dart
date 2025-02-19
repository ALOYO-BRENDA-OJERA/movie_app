// To parse this JSON data, do
//
//     final topRatedResponse = topRatedResponseFromJson(jsonString);

import 'dart:convert';

TopRatedResponse topRatedResponseFromJson(String str) => TopRatedResponse.fromJson(json.decode(str));

String topRatedResponseToJson(TopRatedResponse data) => json.encode(data.toJson());

class TopRatedResponse {
    final int page;
    final List<TopRatedMovie> results;

    TopRatedResponse({
        required this.page,
        required this.results,
    });

    factory TopRatedResponse.fromJson(Map<String, dynamic> json) => TopRatedResponse(
        page: json["page"],
        results: List<TopRatedMovie>.from(json["results"].map((x) => TopRatedMovie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class TopRatedMovie {
    final bool adult;
    final String backdropPath;
    final List<int> genreIds;
    final int id;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final String releaseDate;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    TopRatedMovie({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory TopRatedMovie.fromJson(Map<String, dynamic> json) => TopRatedMovie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
