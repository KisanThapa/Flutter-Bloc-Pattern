import 'package:block_pattern_demo/src/models/item_model.dart';
import 'package:block_pattern_demo/src/resources/movie_api_provider.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();

  // Future<ItemModel> fetchPopularMovies() {
  //   return movieApiProvider.fetchMovieList();
  // }

  // Or Above line of code can be written as
  Future<ItemModel> fetchPopularMovies() => movieApiProvider.fetchMovieList();
}
