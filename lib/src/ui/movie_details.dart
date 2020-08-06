import 'package:block_pattern_demo/src/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:block_pattern_demo/src/blocs/movies_bloc.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.total_pages.toString(),
              );
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
      ),
    );
  }
}
