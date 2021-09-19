import 'dart:convert';

import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';

TvShowModel tvShowFromJson(String str) =>
    TvShowModel.fromJson(json.decode(str));

String tvShowToJson(TvShowModel data) => json.encode(data.toJson());

class TvShowModel extends TvShow {
  TvShowModel({
    required backdropPath,
    required firstAirDate,
    required genreIds,
    required id,
    required name,
    required originCountry,
    required originalLanguage,
    required originalName,
    required overview,
    required popularity,
    required posterPath,
    required voteAverage,
    required voteCount,
  }) : super(
            backdropPath: backdropPath,
            firstAirDate: firstAirDate,
            genreIds: genreIds,
            id: id,
            name: name,
            originCountry: originCountry,
            originalLanguage: originalLanguage,
            originalName: originalName,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_name": originalName == null ? null : originalName,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}
