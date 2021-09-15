import 'package:flutter/material.dart';
import 'package:moviesapp/services/MovieService.dart';
import 'package:moviesapp/models/MovieInfo.dart';
import 'package:moviesapp/components/PaddedText.dart';

class MovieDetailShort extends StatelessWidget {
  final String movieName;
  final String imdbId;

  MovieDetailShort({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<MovieInfo>(
          future: getMovie(this.imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("" + snapshot.data.genre, style:TextStyle(fontWeight: FontWeight.w300)),
                        Container(
                          margin: EdgeInsets.only(top:4),
                          padding: EdgeInsets.symmetric(vertical:4, horizontal:10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Text(snapshot.data.imdbRating+ " IMDB", style: TextStyle(color: Colors.white))),
                      ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
    );
  }
}
