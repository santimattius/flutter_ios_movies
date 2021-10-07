import 'dart:convert';

import 'package:flutter_ios_movies/the_movie_db/data/models/tv_show_model.dart';

TvShowPage tvShowPageFromJson(String str) =>
    TvShowPage.fromJson(json.decode(str));

String tvShowToJson(TvShowPage data) => json.encode(data.toJson());

class TvShowPage {
  TvShowPage({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<TvShowModel> results;
  final int totalPages;
  final int totalResults;

  factory TvShowPage.fromJson(Map<String, dynamic> json) => TvShowPage(
        page: json["page"],
        results: List<TvShowModel>.from(
            json["results"].map((x) => TvShowModel.fromJson(x))),
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
