
import 'package:flutter/material.dart';



class ForumCreate extends StatefulWidget {
  const ForumCreate({Key? key}) : super(key: key);

  @override
  State<ForumCreate> createState() => _ForumCreateState();
}

class _ForumCreateState extends State<ForumCreate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Card(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("Create Forum",
                style: TextStyle(
                  fontSize: 30
                ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Row(
                  children: [
                    Text("Insert Name",
                    style: TextStyle(
                      fontSize: 20
                    ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 200,
                      height: 30,
                      child:TextField(

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Forun Name',
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                        ),
                      ) ,
                    ),


                  ],
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 20,
                maxLength: 1000,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  hintText: 'Description',

                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child:FloatingActionButton(onPressed:(){},
                  shape: RoundedRectangleBorder(),
                  child: Text("Create"),
                ) ,
              )


            ],
          ),
        ),
      ),
    );
  }
}

