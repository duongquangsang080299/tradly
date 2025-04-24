class StoreModel {
  final int? id;
  final String name;
  final String? description;
  final String? imageUrl;
  final String? address;
  final String? webAddress;
  final String? logoStore;

  StoreModel({
    this.id,
    required this.name,
    this.imageUrl,
    this.logoStore,
    this.description,
    this.address,
    this.webAddress,
  });

  // Factory method to create a StoreModel from a JSON object
  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      logoStore: json['logoStore'],
      description: json['description'],
      address: json['address'],
      webAddress: json['webAddress'],
    );
  }

  // Method to convert StoreModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'logoStore': logoStore,
      'description': description,
      'address': address,
      'webAddress': webAddress,
    };
  }
}
