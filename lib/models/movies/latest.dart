// To parse this JSON data, do
//
//     final latestMovie = latestMovieFromJson(jsonString);

import 'dart:convert';

LatestMovie latestMovieFromJson(String str) => LatestMovie.fromJson(json.decode(str));

String latestMovieToJson(LatestMovie data) => json.encode(data.toJson());

class LatestMovie {
    final bool adult;
    final String? backdropPath;
    final dynamic belongsToCollection;
    final int budget;
    final List<dynamic> genres;
    final String homepage;
    final int id;
    final String imdbId;
    final List<String> originCountry;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String? posterPath;
    final List<dynamic> productionCompanies;
    final List<dynamic> productionCountries;
    final String releaseDate;
    final int revenue;
    final int runtime;
    final List<dynamic> spokenLanguages;
    final String status;
    final String tagline;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    LatestMovie({
        required this.adult,
        this.backdropPath,
        this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory LatestMovie.fromJson(Map<String, dynamic> json) => LatestMovie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<dynamic>.from(json["genres"] ?? []),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: List<String>.from(json["origin_country"]),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<dynamic>.from(json["production_companies"] ?? []),
        productionCountries: List<dynamic>.from(json["production_countries"] ?? []),
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<dynamic>.from(json["spoken_languages"] ?? []),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x)),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x)),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x)),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
