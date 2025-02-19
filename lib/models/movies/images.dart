// To parse this JSON data, do
//
//     final movieImages = movieImagesFromJson(jsonString);

import 'dart:convert';

MovieImages movieImagesFromJson(String str) => MovieImages.fromJson(json.decode(str));

String movieImagesToJson(MovieImages data) => json.encode(data.toJson());

class MovieImages {
    final List<Backdrop> backdrops;

    MovieImages({
        required this.backdrops,
    });

    factory MovieImages.fromJson(Map<String, dynamic> json) => MovieImages(
        backdrops: List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
    };
}

class Backdrop {
    final double aspectRatio;
    final int height;
    final String? iso6391;
    final String filePath;
    final double voteAverage;
    final int voteCount;
    final int width;

    Backdrop({
        required this.aspectRatio,
        required this.height,
        this.iso6391,
        required this.filePath,
        required this.voteAverage,
        required this.voteCount,
        required this.width,
    });

    factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
    };
}
