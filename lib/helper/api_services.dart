import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
class Api {
  Future<List<dynamic>> getApiServices(String Url) async{
    try {
      final url = Uri.parse('https://fakestoreapi.com/'+Url);
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
// Decode the JSON response into a list of Product objects
        final data = jsonDecode(response.body);
        return  data;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error, s) {
      print("errpr => $error ");
      debugPrintStack(stackTrace: s);
      throw Exception('Error: $error');
    }
  }

  Future<dynamic> post ( {required dynamic body, required String url , String? token })async{
    Map<String , String> header={} ;
    if(token !=null){
      header.addAll({
        "Authorization":"${token}",
      });
    }
    try {
      http.Response response = await http.post(Uri.parse(url),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(" problem with status code${response
            .statusCode} ,, with body ${jsonDecode(response.body)} ");
      }
    }catch( error , e ){
      print("errpr => $error ");
      debugPrintStack(stackTrace: e);
      throw Exception('Error: $error');
    }
  }

  Future<dynamic> put ( {required dynamic body, required String url , String? token })async{
    Map<String , String> header={
      "Content-Type":"application/x-www-form-urlencoded"
    } ;
    if(token !=null){
      header.addAll({
        "Authorization":"${token}",
      });
    }
    try {
      http.Response response = await http.put(Uri.parse(url),
        body: body,
        headers: header,
      );
      print(" url => $url  body =>  $body  ");
      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);

        print(" data => $data ");
        return data;
      } else {
        throw Exception(" problem with status code${response
            .statusCode} ,, with body ${jsonDecode(response.body)} ");
      }
    }catch(error , e ){
      print("Error => $error");
      debugPrintStack(stackTrace: e);
      throw Exception('Error: $error');
    }
  }

}