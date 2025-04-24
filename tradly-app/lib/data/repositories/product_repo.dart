import 'package:tradly_app/core/api/api_client.dart';
import 'package:tradly_app/core/env/env.dart';
import 'package:tradly_app/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchProductsByCategoryId(int categoryId);
  Future<List<ProductModel>> fetchProductById(int productId);
}

class ProductRepositoryImpl implements ProductRepository {
  final TradlyApiClient _apiClient;

  ProductRepositoryImpl({
    required TradlyApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<ProductModel>> fetchProductsByCategoryId(int categoryId) async {
    String apiUrl = '${Env.endPoint}products';
    final response = await _apiClient.get(
      apiUrl,
      queryParams: {
        'select': 'id,title,price,brand,newPrice,imageUrl,categoryId',
        'categoryId': 'eq.$categoryId',
      },
    );
    final jsonData = response.data;

    final products =
        (jsonData as List).map((json) => ProductModel.fromJson(json)).toList();

    return products;
  }

  @override
  Future<List<ProductModel>> fetchProductById(int productId) async {
    String apiUrl = '${Env.endPoint}products';
    final response = await _apiClient.get(
      apiUrl,
      queryParams: {
        'select': '*',
        'id': 'eq.$productId',
      },
    );
    final jsonData = response.data;

    final products =
        (jsonData as List).map((json) => ProductModel.fromJson(json)).toList();

    return products;
  }
}
