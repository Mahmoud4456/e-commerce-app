

import '../helper/api_services.dart';
import '../models/product_model.dart';

class CategoryServices {
Future <List<ProductModel>> getCategory({required categoryName}) async{
  List <dynamic> data = await Api().getApiServices( "category/${categoryName}");
  List<ProductModel> ProductList = [];

  return ProductList;
}
}