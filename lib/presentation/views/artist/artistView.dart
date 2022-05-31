import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Artist extends StatefulWidget {
  const Artist({Key? key}) : super(key: key);

  @override
  State<Artist> createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  int likes = 11;
  String imageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/640px-PNG_transparency_demonstration_1.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
          child: Container(
            child: Card(
              color: Colors.grey,

              child: Column(
                children: [
                  Container(
                    child: Image.network(imageUrl),
                    height: 200,
                  ),

                  const ListTile(
                    title: Center(
                        child: Text(
                          "Artista Famoso",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                    ),
                  ),

                  RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.orange),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.orange,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.orange,
                        )),
                    onRatingUpdate: (double value) {
//here goes API call for updating rating
                    },
                  ),

                  Row(
                    children: [
                      Text(likes.toString()),
                      TextButton(
                        child:Text("FOLLOW"),
                        onPressed: ()
                        {setState(() {
                          likes += 1;
                        });},
                      ),
                      TextButton(
                        child:Text("UNFOLLOW"),
                        onPressed: ()
                        {setState(() {
                          likes -= 1;
                        });},
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  ),
                ],
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green, width: 1)
              ),
            ),
            height: 420,
          )
      ),
    );
  }
}
