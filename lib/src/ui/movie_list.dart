import 'package:block_pattern_demo/src/blocs/movies_bloc.dart';
import 'package:block_pattern_demo/src/models/item_model.dart';
import 'package:flutter/material.dart';

import 'movie_details.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();

    // network call here
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    // dispose bloc here
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(5),
          child: GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(
                snapshot.data.results[index],
                context,
              ),
            ),
          ),
        );
      },
    );
  }

  openDetailPage(moviedData, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MovieDetail(
            title: moviedData.title,
            posterUrl: moviedData.backdrop_path,
            description: moviedData.overview,
            releaseDate: moviedData.release_date,
            voteAverage: moviedData.vote_average.toString(),
            movieId: moviedData.id,
          );
        },
      ),
    );
  }
}
