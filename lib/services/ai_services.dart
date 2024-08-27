import 'package:untitled1/helper/api_services.dart';
import 'package:untitled1/models/product_model.dart';

// Define a model class to represent a product from the API response
class ProductGetData {
  Future<List<ProductModel>> fetchProducts() async {
    final List<dynamic> data = await Api().getApiServices("products");

    final List<ProductModel> listProduct = List<ProductModel>.from(data.map(
      (e) {
        return ProductModel.fromJson(e);
      },
    ));
    return listProduct;
  }
}

// class ProductX {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String category;
//   final String image;
//   final Rating rating;
//
//   ProductX({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });
//
//   factory ProductX.fromJson(dynamic json) {
//     return ProductX(
//       id: json['id'],
//       title: json['title'],
//       price: json['price'].toDouble(),
//       description: json['description'],
//       category: json['category'],
//       image: json['image'],
//       rating: Rating.fromJson(json['rating']),
//     );
//   }
// }
//
// // Define a model class to represent the rating within a product
// class Rating {
//   final double rate;
//   final int count;
//
//   Rating({required this.rate, required this.count});
//
//   factory Rating.fromJson(Map<String, dynamic> json) {
//     return Rating(
//       rate: json['rate'].toDouble(),
//       count: json['count'],
//     );
//   }
// }
