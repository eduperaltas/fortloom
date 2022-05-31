import 'package:fortloom/core/framework/globals.dart';
import 'package:fortloom/presentation/widgets/screenBase.dart';
import 'package:fortloom/presentation/widgets/sideBar/navigationBloc.dart';
import 'package:flutter/material.dart';
import 'package:fortloom/domain/entities/event.dart';

class EventListView extends StatefulWidget {
  const EventListView({Key? key}) : super(key: key);

  @override
  State<EventListView> createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  List<Event> events = [
    Event(eventName: 'Event 1',eventDescription: 'a description 1',date: '30/05/2022'),
    Event(eventName: 'Event 2',eventDescription: 'a description 2',date: '31/05/2022'),
    Event(eventName: 'Event 3',eventDescription: 'a description 3',date: '25/05/2022'),
    Event(eventName: 'Event 4',eventDescription: 'a description 4',date: '20/05/2022')
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      body: ShowListEvents(),
    );
  }

  Widget ShowListEvents(){
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context,int index){
          return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                  child: ListTile(
                    onTap: (){},
                    title: Text(events[index].eventName),
                    subtitle: Column(
                        children: <Widget>[
                          Text(events[index].eventDescription),
                          SizedBox(height: 5,),
                          Text(events[index].date)
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
