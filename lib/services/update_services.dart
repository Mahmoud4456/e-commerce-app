import '../helper/api_services.dart';
import '../models/product_model.dart';

class Put {
  Future<ProductModel> updateProductServices(
      {required dynamic id,
        required String title,
      required dynamic price,
      required String des,
      required String image,
      required String category
      }) async {
    Map<String, dynamic> data = await Api().put(body: {
      "id":id ,
      "title": title,
      "price": price,
      "description": des,
      "image": image,
      "category": category,
    }, url: "https://fakestoreapi.com/products/$id");
    return ProductModel.fromJson(data);
  }
}
