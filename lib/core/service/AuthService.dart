

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';



class AuthService{
  var log=Logger();
  Future<http.Response> Login(String email,String password) async{

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

    return response;

  }



}