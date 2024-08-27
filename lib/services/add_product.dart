
import "dart:core";

import "../helper/api.dart";
import "../models/product_model.dart";

class AddProduct{
  
Future <ProductModel> addProduct 
({required String title , required String price ,required String des,required String image, required String category  }) 
  async{
List<dynamic> data = await  Api().post(body: {
  "title": title,
  "price": price,
  "description": des ,
  "image":image ,
  "category": category,
},
 url: "products");
return ProductModel.fromJson(data);
}  
}