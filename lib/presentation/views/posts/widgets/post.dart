import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fortloom/core/framework/globals.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWH(context).width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [headerPost(), body()],
      ),
    );
  }

  Widget headerPost() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://source.unsplash.com/random/200x200?sig=${DateTime.now().millisecondsSinceEpoch}")),
          SizedBox(width: 15),
          Text(
            "User 1",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[600],
              image: DecorationImage(
                  image: NetworkImage(
                      "https://source.unsplash.com/random/200x200?sig=${DateTime.now().millisecondsSinceEpoch}"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "View Comments",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
