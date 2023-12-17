import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projekweb/Model/model.dart';

class MoviePopular {
  final _baseUrl =
      "https://api.themoviedb.org/3/trending/all/day?api_key=38b7614d2e082960304d0afbdbcf5c2e";

  Future<List<MovieApi>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];
        List<MovieApi> movies =
            data.map((e) => MovieApi.fromJson(e)).toList();
        return movies;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
