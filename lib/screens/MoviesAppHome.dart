import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapp/components/MovieList.dart';
import 'package:moviesapp/screens/MovieDetail.dart';
import 'package:moviesapp/services/MovieService.dart';
import 'package:moviesapp/models/Movie.dart';
import 'package:flutter/services.dart';

class MoviesAppHome extends StatefulWidget {
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  final searchTextController = new TextEditingController();
  String searchText = "";
  

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Home', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                
              color: Colors.white,
    border: Border.all(width: 2),
  ),
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                  
                    controller: searchTextController,
        decoration: new InputDecoration(
          border: InputBorder.none,
          
            hintText: 'Search for Movies',
        ),
    ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Search Movies',
                  onPressed: () {
                    setState(() {
                      searchText = searchTextController.text;
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                  },
                ),
              ]),
            ),
            if (searchText.length > 0)
              FutureBuilder<List<Movie>>(
                  future: searchMovies(searchText),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: MovieList(
                              movies: snapshot.data,
                              itemClick: this.itemClick));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
          ],
        ));
  }
}

