import 'package:tradly_app/data/models/product_model.dart';

class CategoryModel {
  final int? id;
  final String? category;
  final String? imageUrl;
  final List<ProductModel> products;

  CategoryModel({
    this.id,
    this.category,
    this.imageUrl,
    required this.products,
  });

  // Factory method to create a CategoryModel from a JSON object
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List? ?? [];
    List<ProductModel> productModels =
        productList.map((i) => ProductModel.fromJson(i)).toList();

    return CategoryModel(
      id: json['id'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      products: productModels,
    );
  }

  // Method to convert CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
}
