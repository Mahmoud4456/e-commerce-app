import 'dart:convert';
import 'package:http/http.dart'as http;
class Api{
    Future<dynamic> get ({required String url,String? token})async{

      Map<String , String> header={} ;
      if(token !=null){
        header.addAll({
          "Authorization":"${token}",
        }); }
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        
   return jsonDecode(response.body);  
  }else {
  throw Exception("error status code ${response.statusCode}");
}
    }

    Future<dynamic> post ( {required dynamic body, required String url , String? token })async{
      Map<String , String> header={} ;
      if(token !=null){
        header.addAll({
          "Authorization":"${token}",
        }); 
      }
    http.Response response = await http.post(Uri.parse(url),
    body: body,
    headers: header,
    );
    if(response.statusCode == 200){
   Map <String ,dynamic> data = jsonDecode(response.body);
    return data ;
    }else {
      throw Exception(" problem with status code${response.statusCode} ,, with body ${jsonDecode(response.body)} ");
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
    http.Response response = await http.post(Uri.parse(url),
    body: body,
    headers: header,
    );
    if(response.statusCode == 200){
   Map <String ,dynamic> data = jsonDecode(response.body);
    return data ;
    }else {
      throw Exception(" problem with status code${response.statusCode} ,, with body ${jsonDecode(response.body)} ");
    }
    }
}