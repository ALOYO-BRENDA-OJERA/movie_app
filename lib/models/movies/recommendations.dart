// To parse this JSON data, do
//
//     final recommendationsResponse = recommendationsResponseFromJson(jsonString);

import 'dart:convert';

RecommendationsResponse recommendationsResponseFromJson(String str) => RecommendationsResponse.fromJson(json.decode(str));

String recommendationsResponseToJson(RecommendationsResponse data) => json.encode(data.toJson());

class RecommendationsResponse {
    final int page;
    final List<RecommendedMovie> results;

    RecommendationsResponse({
        required this.page,
        required this.results,
    });

    factory RecommendationsResponse.fromJson(Map<String, dynamic> json) => RecommendationsResponse(
        page: json["page"],
        results: List<RecommendedMovie>.from(json["results"].map((x) => RecommendedMovie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class RecommendedMovie {
    final String backdropPath;
    final int id;
    final String title;
    final String originalTitle;
    final String overview;
    final String posterPath;
    final String mediaType;
    final bool adult;
    final String originalLanguage;
    final List<int> genreIds;
    final double popularity;
    final String releaseDate;
    final bool video;
    final double voteAverage;
    final int voteCount;

    RecommendedMovie({
        required this.backdropPath,
        required this.id,
        required this.title,
        required this.originalTitle,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.adult,
        required this.originalLanguage,
        required this.genreIds,
        required this.popularity,
        required this.releaseDate,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory RecommendedMovie.fromJson(Map<String, dynamic> json) => RecommendedMovie(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        adult: json["adult"],
        originalLanguage: json["original_language"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "adult": adult,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date": releaseDate,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
