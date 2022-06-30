import 'package:fortloom/domain/entities/ArtistResource.dart';
import 'package:fortloom/domain/entities/CreateForumResource.dart';
import 'package:fortloom/domain/entities/ForumResource.dart';
import 'package:fortloom/domain/entities/PersonResource.dart';
import 'package:fortloom/domain/entities/PostResource.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

class PostService {
  var baseUrl = "http://192.168.0.102:8080/api/v1/publications";
  var log = Logger();
  Future<List<Post>> getall() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<Post> lstPosts = [];
    log.i(response.body);
    log.i(response.statusCode);
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var item in jsonData["content"]) {
      ArtistResource artist = ArtistResource(
          item["artist"]["id"],
          item["artist"]["username"],
          item["artist"]["realname"],
          item["artist"]["lastname"],
          item["artist"]["email"],
          item["artist"]["password"],
          item["artist"]["content"],
          item["artist"]["artistfollowers"],
          item["artist"]["instagramLink"],
          item["artist"]["facebookLink"],
          item["artist"]["twitterLink"]);

      Post postResource = Post(item["id"], item["publicationName"],
          item["publicationDescription"], item["likes"], item["date"], artist);
      lstPosts.add(postResource);
    }

    return lstPosts;
  }

  Future<http.Response> addPost(
      String name, String description, int artistId) async {
    Map data = {
      'publicationName': '$name',
      'publicationdescription': '$description',
      'likes': 1,
    };
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse(
            "http://192.168.0.102:8080/api/v1/artists/${artistId}/publications"),
        headers: {"Content-Type": "application/json"},
        body: body);
    log.i(response.body);
    log.i(response.statusCode);

    return response;
  }
}
