import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movieapp/managers/movieManager.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/pages/editMoviePage.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(movie.name),
          subtitle: Text(movie.category.name),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Düzenle',
          color: Colors.green,
          icon: Icons.edit,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditMoviePage(movie: movie)),
          ),
        ),
        IconSlideAction(
          caption: 'Sil',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => MovieManager().deleteMovie(movie: movie,context: context),
        ),
      ],
    );
  }
}
