import 'dart:convert';

import 'package:flutter_ios_movies/the_movie_db/data/models/movie_model.dart';

MoviePage moviePageFromJson(String str) => MoviePage.fromJson(json.decode(str));

String moviePageToJson(MoviePage data) => json.encode(data.toJson());

class MoviePage {
  MoviePage({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  factory MoviePage.fromJson(Map<String, dynamic> json) => MoviePage(
    page: json["page"],
    results:
    List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}