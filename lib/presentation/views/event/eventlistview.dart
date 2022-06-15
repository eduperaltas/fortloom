import 'package:fortloom/core/framework/globals.dart';
import 'package:fortloom/core/service/EventService.dart';
import 'package:fortloom/domain/entities/ArtistResource.dart';
import 'package:fortloom/presentation/widgets/screenBase.dart';
import 'package:fortloom/presentation/widgets/sideBar/navigationBloc.dart';
import 'package:flutter/material.dart';
import 'package:fortloom/domain/entities/EventResource.dart';

class EventListView extends StatefulWidget {
  const EventListView({Key? key}) : super(key: key);

  @override
  State<EventListView> createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  /*ArtistResource artisttest = ArtistResource(0, "username", "realname", "lastname", "email", "password", "content", 0, "instagramLink", "facebookLink", "twitterLink");
  List<EventResource> events = [
    EventResource(1,'Event 1','a description 1', 0, '30/05/2022',),
    EventResource(eventName: 'Event 2',eventDescription: 'a description 2',date: '31/05/2022',artist: 'Artist 2',likes: 5),
    EventResource(eventName: 'Event 3',eventDescription: 'a description 3',date: '25/05/2022',artist: 'Artist 3',likes: 2),
    EventResource(eventName: 'Event 4',eventDescription: 'a description 4',date: '20/05/2022',artist: 'Artist 4',likes: 3)
  ];*/

  EventService eventservice = EventService();


  Future<List<EventResource>> getData(){
    return eventservice.getallEvents();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      body: ShowListEvents(),
    );
  }

  Widget ShowListEvents(){
    return ListView.builder(
        itemCount: 2, //events.length
        itemBuilder: (BuildContext context,int index){
          return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                  child: ListTile(
                    title: Row(
                        children: <Widget>[
                          Text("events[index].artist"),
                          SizedBox(width: 70,),
                          Text("events[index].eventName")
                        ],
                    ),
                    subtitle: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Text("events[index].eventDescription"),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Text("events[index].date"),
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      //events[index].likes += 1;
                                    });
                                    print('event 0 number of likes: '); //${index}  and   ${events[index].likes}
                                  },
                                  icon: Icon(Icons.thumb_up)
                              ),
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      //events[index].likes -= 1;
                                    });
                                    print('event 0 number of likes: '); //${index} and ${events[index].likes}
                                  },
                                  icon: Icon(Icons.thumb_down)
                              ),
                              SizedBox(width: 20,),
                              Text('{events[index].likes}'),
                            ],
                          )
                        ],
                    ),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/imgs/avatar_example.png'),
                    ),
                  )
              )
          );
        }
    );
  }
}
