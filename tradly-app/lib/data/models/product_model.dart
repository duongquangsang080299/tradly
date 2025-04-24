enum ProductTag {
  newProduct,
  mostPopular,
}

class ProductType {
  final int id;
  final int productId;
  final String type;

  ProductType({
    required this.id,
    required this.productId,
    required this.type,
  });

  // Factory method to create a ProductType from a JSON object
  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(
      id: json['id'],
      productId: json['productId'],
      type: json['type'],
    );
  }

  // Method to convert ProductType to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'type': type,
    };
  }
}

class ProductModel {
  final int? id;
  final String title;
  final String imageUrl;
  final String price;
  final String? brand;
  final String? newPrice;
  final String? description;
  final String? priceType;
  final String? condition;
  final String? location;
  final String? categoryType;
  final int? categoryId;
  final List<ProductType>? productTypes;

  ProductModel({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.brand,
    this.newPrice,
    this.categoryId,
    this.description,
    this.productTypes,
    this.priceType,
    this.condition,
    this.location,
    this.categoryType,
  });

  // Factory method to create a ProductModel from a JSON object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      brand: json['brand'],
      newPrice: json['newPrice'],
      description: json['description'],
      priceType: json['priceType'],
      condition: json['condition'],
      location: json['location'],
      categoryType: json['categoryType'],
      categoryId: json['categoryId'],
      productTypes: (json['product_types'] as List<dynamic>?)
          ?.map((e) => ProductType.fromJson(e))
          .toList(),
    );
  }

  // Method to convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'brand': brand,
      'description': description,
      'newPrice': newPrice,
      'priceType': priceType,
      'condition': condition,
      'location': location,
      'categoryType': categoryType,
      'categoryId': categoryId,
      'product_types': productTypes?.map((e) => e.toJson()).toList(),
    };
  }

  ProductModel copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? price,
    String? brand,
    String? newPrice,
    String? description,
    String? priceType,
    String? condition,
    String? location,
    String? categoryType,
    int? categoryId,
    List<ProductType>? productTypes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      newPrice: newPrice ?? this.newPrice,
      description: description ?? this.description,
      priceType: priceType ?? this.priceType,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      categoryType: categoryType ?? this.categoryType,
      categoryId: categoryId ?? this.categoryId,
      productTypes: productTypes ?? this.productTypes,
    );
  }
}
