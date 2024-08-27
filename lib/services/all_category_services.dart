


import '../helper/api_services.dart';
import '../models/product_model.dart';

class allCategoryServices{
  Future<List<dynamic>> getAllCategory() async{
 
  List<dynamic> data = await Api().getApiServices( "categories");
  final List<ProductModel> listProduct = List<ProductModel>.from(data.map(
        (e) {
      return ProductModel.fromJson(e);
    },
  ));
  return listProduct;
}
  }
