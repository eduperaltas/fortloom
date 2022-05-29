

import 'package:flutter/material.dart';


class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.grey,
                child: Column(
                  children: [
                       Text("Forum Name",
                       style: TextStyle(fontSize: 20),
                       ),
                       SizedBox(height: 7),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black54,
                        ),

                        child:IconButton(
                            icon: const Icon(Icons.flag),
                            onPressed: () {}
                        ),
                      ),
                      ) ,

                    Align(
                        alignment: Alignment.topLeft,
                        child:Text("nombre Apellido",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child:Text("Descripcion",
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ),
                    ),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 200,
                  child: Card(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text("Forum Comment",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 7),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black54,
                            ),

                            child:IconButton(
                                icon: const Icon(Icons.flag),
                                onPressed: () {}
                            ),
                          ),
                        ) ,
                        Align(
                          alignment: Alignment.topLeft,
                          child:Text("nombre Apellido",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child:Text("fecha",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 200,
                  child: Card(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text("Write a Comment",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 200,

                          child:TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 20,
                            maxLength: 1000,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',

                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(onPressed:(){},
                              shape: RoundedRectangleBorder(),
                              child: Text("Accept"),
                            ) ,
                            FloatingActionButton(onPressed:(){},
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Colors.red,
                              child: Text("Delete"),
                            ) ,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
