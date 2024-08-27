
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled1/models/users.dart';

import '../models/product_model.dart';


class UserServices{
 //String baseUrl = "https://reqres.in/api/";
  String baseUrl = "https://fakestoreapi.com/";

  Future<List<ProductModel>> getUserData ()async{
    List<ProductModel> products = [];
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + "products"));
      if (response.statusCode == 200) {
        final data = response.body;
        //  Map<String , dynamic>
        //List<dynamic>
        final decodedData = jsonDecode(data) as List<dynamic>;
        // List<dynamic> users = jsonDe.cast<Map<String , dynamic>>();
        // print(users.toString());
        if (decodedData is List<Map<String, dynamic>>) {
          products =
              decodedData.map((user) => ProductModel.fromJson(user)).toList();
        } else {
          throw Exception('Unexpected data format. Expected a list of maps.');
        }
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
      // for(var user in users){
      //  ProductModel newProduct = ProductModel.fromJson(user);
      //  AllUser.add(newProduct);
      // }
      print(products);

    }catch(error){
     throw Exception(error.toString());
    }
    return products ;
  }
}