import 'package:tradly_app/core/api/api_client.dart';
import 'package:tradly_app/core/env/env.dart';
import 'package:tradly_app/data/models/category_model.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/models/store_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<StoreModel>> fetchStores();
  Future<List<ProductModel>> fetchNewProducts(List<int> productIds);
  Future<List<ProductModel>> fetchPopularProducts(List<int> productIds);
}

class HomeRepositoryImpl implements HomeRepository {
  final TradlyApiClient _apiClient;

  HomeRepositoryImpl({
    required TradlyApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    String apiUrl = '${Env.endPoint}categories';

    final response = await _apiClient.get(
      apiUrl,
      queryParams: {
        'select': '*',
      },
    );
    final jsonData = response.data;

    final categories =
        (jsonData as List).map((json) => CategoryModel.fromJson(json)).toList();
    return categories;
  }

  @override
  Future<List<ProductModel>> fetchNewProducts(List<int> productIds) async {
    String apiUrl = '${Env.endPoint}new_products';

    final response = await _apiClient.get(
      apiUrl,
      queryParams: {
        'select': 'id,productId,type',
        'productId': 'in.(${productIds.join(",")})',
      },
    );
    final jsonData = response.data;

    final productTypes =
        (jsonData as List).map((json) => ProductType.fromJson(json)).toList();

    // Fetch product details from the products table
    final productResponse = await _apiClient.get(
      '${Env.endPoint}products',
      queryParams: {
        'select': 'id,title,imageUrl,price,brand',
        'id': 'in.(${productIds.join(",")})',
      },
    );
    final productData = productResponse.data;

    return productData.map<ProductModel>((product) {
      return ProductModel(
        id: product['id'],
        title: product['title'],
        imageUrl: product['imageUrl'],
        price: product['price'],
        brand: product['brand'],
        productTypes: productTypes
            .where((type) => type.productId == product['id'])
            .toList(),
      );
    }).toList();
  }

  @override
  Future<List<ProductModel>> fetchPopularProducts(List<int> productIds) async {
    String apiUrl = '${Env.endPoint}popular_products';

    final response = await _apiClient.get(
      apiUrl,
      queryParams: {
        'select': 'id,productId,type',
        'productId': 'in.(${productIds.join(",")})',
      },
    );
    final jsonData = response.data;

    final productTypes =
        (jsonData as List).map((json) => ProductType.fromJson(json)).toList();

    // Fetch product details from the products table
    final productResponse = await _apiClient.get(
      '${Env.endPoint}products',
      queryParams: {
        'select': 'id,title,imageUrl,price,brand',
        'id': 'in.(${productIds.join(",")})',
      },
    );
    final productData = productResponse.data;

    return productData.map<ProductModel>((product) {
      return ProductModel(
        id: product['id'],
        title: product['title'],
        imageUrl: product['imageUrl'],
        price: product['price'],
        brand: product['brand'],
        productTypes: productTypes
            .where((type) => type.productId == product['id'])
            .toList(),
      );
    }).toList();
  }

  @override
  Future<List<StoreModel>> fetchStores() async {
    String apiUrl = '${Env.endPoint}stores';

    final response = await _apiClient.get(
      apiUrl,
      queryParams: {
        'select': '*',
      },
    );
    final jsonData = response.data;

    final stores =
        (jsonData as List).map((json) => StoreModel.fromJson(json)).toList();
    return stores;
  }
}
