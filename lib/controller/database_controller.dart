import 'package:ecommerce/models/add_to_cart_model.dart';

import '../models/api_path.dart';
import '../models/user_data.dart';
import '../services/firestore_services.dart';
import '../view/widgets/Product.dart';

abstract class Database {
  Stream<List<Product>> saleProductsStream();

  Stream<List<Product>> newProductsStream();

  Future<void> setUserData(UserData userData);

  Future<void> addToCart(AddToCartModel product);
}

String get decumentId => DateTime.now().toIso8601String().toString();

class FirestoreDatabase implements Database {
  final _services = FireStoreServices.instance;
  final String uid;

  FirestoreDatabase(this.uid);

  @override
  Stream<List<Product>> saleProductsStream() => _services.collectionsStream(
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
    queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
  );

  @override
  Stream<List<Product>> newProductsStream() => _services.collectionsStream(
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
  );

  Future<void> addProduct(Product product) async =>
      _services.setData(path: 'products/${decumentId}', data: product.toMap());

  Future<void> setProduct(Product product) async =>
      _services.setData(path: 'products/${product.id}', data: product.toMap());

  Future<void> deleteProduct(Product product) async =>
      _services.deleteData(path: 'products/${product.id}');

  @override
  Future<void> setUserData(UserData userData) async => await _services.setData(
    path: ApiPath.users(userData.uid),
    data: userData.toMap(),
  );

  @override
  Future<void> addToCart(AddToCartModel product) async => await _services
      .setData(path: ApiPath.addToCart(uid, product.id), data: product.toMap());
}
