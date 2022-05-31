import 'package:fortloom/core/framework/globals.dart';
import 'package:fortloom/presentation/widgets/screenBase.dart';
import 'package:fortloom/presentation/widgets/sideBar/navigationBloc.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {

  bool post = false;

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      body:Center(
          child:Container(
              child:Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    CardMainEvent(),
                    SizedBox(height: 30,),
                    ShowForm(),
                    SizedBox(height: 20,),
                    ShowButtons()
                  ]
              )
          )
      )
    );
  }

  Widget CardMainEvent(){
    return Card(
      child:Container(
          padding: EdgeInsets.all(10),
          width: 200,
          height: 200,
          child:Column(
            children:<Widget> [
              Text('Make a Event!'),
              SizedBox(height: 10,),
              Image(
                  image: AssetImage('assets/imgs/events_image.jpg'),
                  height: 100,
              ),
              SizedBox(height: 5,),
              RaisedButton(
                  onPressed: (){
                    setState(() {
                      post = true;
                    });
                    print(post);
                  },
                  child: Text("Post Event"),
                  color: Colors.white,
              )
            ],
          )
      )
    );
  }

  Widget PostEventForm(){
    return Card(
        child: Container(
            width: 350,
            height: 250,
            child: Column(
              children: <Widget>[
                Text("Create your Event!"),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'EventName',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'EventDescription',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Date',
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    RaisedButton(
                        onPressed: (){
                          setState(() {
                            post = false;
                          });
                          print(post);
                        },
                        child:Text("Cancel"),
                        color:Colors.white
                    ),
                    SizedBox(width: 10,),
                    RaisedButton(
                        onPressed: (){},
                        child:Text("Clean"),
                        color:Colors.white
                    ),
                    SizedBox(width: 10,),
                    RaisedButton(
                        onPressed: (){},
                        child:Text("Create and Post"),
                        color:Colors.white
                    )
                  ],
                )
              ],
          )
        )
    );
  }

  Widget ShowButtons(){
    return Row(
      children: <Widget>[
        SizedBox(width: 20,),
        RaisedButton(
            onPressed: (){},
            child: Text("Show All Events"),
            color:Colors.white
        ),
        SizedBox(width: 100,),
        RaisedButton(
            onPressed: (){},
            child: Text("Not Show Events"),
            color:Colors.white
        ),
      ],
    );
  }

  Widget ShowForm(){
    if(post){
      return PostEventForm();
    }else{
      return Icon(
          Icons.cancel,
          color: Colors.white
      );
    }
  }

}


