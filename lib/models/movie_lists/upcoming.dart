// To parse this JSON data, do
//
//     final upcomingResponse = upcomingResponseFromJson(jsonString);

import 'dart:convert';

UpcomingResponse upcomingResponseFromJson(String str) => UpcomingResponse.fromJson(json.decode(str));

String upcomingResponseToJson(UpcomingResponse data) => json.encode(data.toJson());

class UpcomingResponse {
    final Dates dates;
    final int page;
    final List<UpcomingMovie> results;

    UpcomingResponse({
        required this.dates,
        required this.page,
        required this.results,
    });

    factory UpcomingResponse.fromJson(Map<String, dynamic> json) => UpcomingResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<UpcomingMovie>.from(json["results"].map((x) => UpcomingMovie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Dates {
    final String maximum;
    final String minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"],
        minimum: json["minimum"],
    );

    Map<String, dynamic> toJson() => {
        "maximum": maximum,
        "minimum": minimum,
    };
}

class UpcomingMovie {
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

    UpcomingMovie({
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

    factory UpcomingMovie.fromJson(Map<String, dynamic> json) => UpcomingMovie(
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
