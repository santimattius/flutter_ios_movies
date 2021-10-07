import 'package:flutter_ios_movies/shared/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class TheMovieDBDataSource {
  final http.Client client;

  TheMovieDBDataSource({required this.client});

  Future<String> fetch(
      {required String endpoint,
      required Map<String, String> queryParams}) async {
    queryParams['api_key'] = 'ee6fa3652297841e02d5808229a45d6d';
    final url = Uri.https(BASE_URL, '/3/$endpoint', queryParams);
    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }

  static const BASE_URL = "api.themoviedb.org";
}
