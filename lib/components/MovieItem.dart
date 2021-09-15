import 'package:flutter/material.dart';
import 'package:moviesapp/components/MovieDetailsShort.dart';
import 'package:moviesapp/models/Movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      clipBehavior: Clip.none,
      children: [
        
          Container(
            
            height: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: new BoxDecoration(
              
              boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: Offset(0, 15), // Shadow position
            ),
          ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white),
            
          ),
        
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(children: <Widget>[
                if (this.movie.poster != "N/A")
                  ImageCard(image:this.movie.poster)
              ]),
              SizedBox(width:20),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      MovieDetailShort(movieName: this.movie.title, imdbId :this.movie.imdbID)
                    ]),
              )
            ],
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          
        ),
      ],
    );
  }
}

class ImageCard extends StatelessWidget {
  final String image;
  const ImageCard({this.image, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
        image,
        height: 170.0,
        width: 130.0,
        fit: BoxFit.cover,
    ),
);
  }
}
