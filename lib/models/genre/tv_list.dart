// To parse this JSON data, do
//
//     final tvGenreResponse = tvGenreResponseFromJson(jsonString);

import 'dart:convert';

TvGenreResponse tvGenreResponseFromJson(String str) => TvGenreResponse.fromJson(json.decode(str));

String tvGenreResponseToJson(TvGenreResponse data) => json.encode(data.toJson());

class TvGenreResponse {
    final List<TvGenre> genres;

    TvGenreResponse({
        required this.genres,
    });

    factory TvGenreResponse.fromJson(Map<String, dynamic> json) => TvGenreResponse(
        genres: List<TvGenre>.from(json["genres"].map((x) => TvGenre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}

class TvGenre {
    final int id;
    final String name;

    TvGenre({
        required this.id,
        required this.name,
    });

    factory TvGenre.fromJson(Map<String, dynamic> json) => TvGenre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    static String getGenreName(int id) {
        switch (id) {
            case 10759: return "Action & Adventure";
            case 16: return "Animation";
            case 35: return "Comedy";
            case 80: return "Crime";
            case 99: return "Documentary";
            case 18: return "Drama";
            case 10751: return "Family";
            case 10762: return "Kids";
            case 9648: return "Mystery";
            case 10763: return "News";
            case 10764: return "Reality";
            case 10765: return "Sci-Fi & Fantasy";
            case 10766: return "Soap";
            case 10767: return "Talk";
            case 10768: return "War & Politics";
            case 37: return "Western";
            default: return "Unknown";
        }
    }
}
