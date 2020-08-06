import 'dart:convert';

import 'package:block_pattern_demo/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  // final _apiKey = "your_api_key";
  final _apiKey = "c317547108a6e9fa02ae48865befe368";

  Future<ItemModel> fetchMovieList() async {
    print("entered");

    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception("Failed to load post.");
    }
  }
}
