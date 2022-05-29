
import 'package:flutter/material.dart';
import 'package:fortloom/presentation/views/Forum/ForumCreate.dart';


class ForumSection extends StatefulWidget {
  const ForumSection({Key? key}) : super(key: key);

  @override
  State<ForumSection> createState() => _ForumSectionState();
}

class _ForumSectionState extends State<ForumSection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         home:Scaffold(
           body: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(padding: const EdgeInsets.only(left: 350),
                   child:Ink(
                     decoration: const ShapeDecoration(
                       color: Colors.blueGrey,
                       shape: CircleBorder(),
                     ),

                     child: IconButton(
                       icon: const Icon(Icons.add),
                       color: Colors.black,
                       onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(
                             builder: (context)=> ForumCreate(),
                         ));
                       },),

                   ),
                 ),
                 Container(
                   height: 150,
                   width: 300,
                   child: Card(
                     child: Column(
                       children: <Widget>[

                         Align(alignment: Alignment.topRight,
                           child: SizedBox(
                             height: 18,
                             width: 20,
                             child:FloatingActionButton(
                             shape: RoundedRectangleBorder(),
                             child: Icon(Icons.arrow_forward_ios,
                               size: 18,
                           ) ,

                             onPressed: (){}
                         ),
                           ),
                         ),

                         Padding(
                             padding: new EdgeInsets.all(10.0),


                         child:Text('Nombre de forojjjjjjjjjjjjjjjjjjjjjjjjj gdggfddg  gd', style: TextStyle(fontSize: 20)),

                         ),









                         Align(
                           alignment: Alignment.bottomLeft,
                           child: Text("NOMBRE DE USUARIO",
                             style: TextStyle(fontSize: 10),


                           ),
                         )


                       ],
                     ),
                   ),
                 )

               ],
             ),
           ),
         ) ,


      
    );

  }
}
