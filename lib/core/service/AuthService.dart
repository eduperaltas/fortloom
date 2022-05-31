

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';



class AuthService{
  var log=Logger();
  final storage= new FlutterSecureStorage();
  Future<String> Login(String email,String password) async{

    Map data ={
      'nombreUsuario': '$email',
       'password':  '$password'
    };
    var body = json.encode(data);
    final response = await http.post(Uri.parse("http://192.168.0.201:8080/auth/login"),
        headers: {"Content-Type": "application/json"}, body: body
    );
    log.i(response.body);
    log.i(response.statusCode);
    if(response.statusCode!=200){
      throw Exception("Error");
    }
    String body2 = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body2);
    StoreToken(jsonData["token"]);
    String token =  jsonData["token"];

    print(GetUsername(token));
    return jsonData["token"];

  }
  Future<void> StoreToken(String token) async{


    await storage.write(key: "token", value: token);
  }
    Future<String?> getToken() async {
    return   await storage.read(key: "token");
  }
  String GetUsername(String token) {
    final parts = token.split(".");
    final payload= parts[1];
    String payloadDecoded = base64Url.normalize(payload);
    String prevalues= utf8.decode(base64Url.decode(payloadDecoded));
    final  values =  jsonDecode(prevalues);
    String username = values["sub"];
    return username;

  }
}