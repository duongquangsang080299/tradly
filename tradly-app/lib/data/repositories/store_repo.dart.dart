import 'package:tradly_app/core/api/api_client.dart';
import 'package:tradly_app/core/env/env.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/models/store_model.dart';

abstract class StoreRepository {
  Future<bool> hasStore();
  Future<void> createStore(StoreModel store);
  Future<void> addProduct(ProductModel product);
  Future<void> editProduct(ProductModel product);
  Future<void> deleteProduct(String productId);
  Future<List<ProductModel>> getProducts();
  Future<void> deleteStore(String storeId);
}

class StoreRepositoryImpl implements StoreRepository {
  final TradlyApiClient _apiClient;

  StoreRepositoryImpl({
    required TradlyApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<bool> hasStore() async {
    String apiUrl = 'stores';
    final response = await _apiClient.get(apiUrl);
    final jsonData = response.data;

    return jsonData.isNotEmpty;
  }

  @override
  Future<void> createStore(StoreModel store) async {
    String apiUrl = '${Env.endPoint}stores';

    final data = store.toJson();
    await _apiClient.post(
      apiUrl,
      data: data,
    );
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    String apiUrl = 'products';

    final data = product.toJson();
    data['imageUrl'] = product.imageUrl;
    await _apiClient.post(apiUrl, data: data);
  }

  @override
  Future<void> editProduct(ProductModel product) async {
    String apiUrl = 'products/${product.id}';
    final data = product.toJson();
    await _apiClient.patch(apiUrl, data: data);
  }

  @override
  Future<void> deleteProduct(String productId) async {
    String apiUrl = 'products/$productId';
    await _apiClient.delete(apiUrl);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    String apiUrl = 'products';
    final response = await _apiClient.get(apiUrl);
    final jsonData = response.data;
    final products =
        (jsonData as List).map((json) => ProductModel.fromJson(json)).toList();
    return products;
  }

  @override
  Future<void> deleteStore(String storeId) async {
    String apiUrl = 'stores/$storeId';
    await _apiClient.delete(apiUrl);
  }
}
