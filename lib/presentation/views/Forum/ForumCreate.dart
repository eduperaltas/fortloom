
import 'package:flutter/material.dart';
import 'package:fortloom/core/service/ForumService.dart';
import 'package:fortloom/presentation/views/Forum/ForumSection.Dart.dart';



class ForumCreate extends StatefulWidget {
  const ForumCreate({Key? key}) : super(key: key);

  @override
  State<ForumCreate> createState() => _ForumCreateState();
}

class _ForumCreateState extends State<ForumCreate> {

  ForumService forumService=new ForumService();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController DescriptionController = new TextEditingController();


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
                        controller: nameController,
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
                controller: DescriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  hintText: 'Description',

                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child:FloatingActionButton(onPressed:(){
                  heroTag: "heroTag";
                  forumService.addForum(nameController.text.trim(), DescriptionController.text.trim());

                  Navigator.pop(context, true);
                },
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

