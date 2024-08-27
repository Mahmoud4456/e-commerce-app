class ProductModel {
  dynamic id;
  String title;
  dynamic price;
  String description;
  String category;
//  RateModel rating;

  String image;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      //required this.rating
      });

  factory ProductModel.fromJson(dynamic jsonData) {
    return ProductModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        description: jsonData["description"],
        category: jsonData["category"],
        image: jsonData["image"],
      //  rating: RateModel.fromJson(jsonData["rating"])
    );
  }
}


class RateModel {
  final dynamic rate;
  final int count;

  RateModel({required this.rate, required this.count});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      rate: json["rate"] ? " ":json['rate'].toString(),
      count: json['count'],
    );
  }
}










// class RateModel {
//   String? rating;
//
//   int count;
//
//   RateModel({required this.rating, required this.count});
//
//   factory RateModel.fromJson(jsonData) {
//     return RateModel(
//       rating: jsonData["rate"] == null ? " " : jsonData["rate"].toString(),
//       count: jsonData["count"],
//     );
//   }
// }

// class ProductModel {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String image;
//   final String category;
//
//   const ProductModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.image,
//     required this.category,
//   });
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'] as int,
//       title: json['title'] as String,
//       price: json['price'] as double,
//       description: json['description'] as String,
//       image: json['image'] as String,
//       category: json['category'] as String,
//     );
//   }
// }
