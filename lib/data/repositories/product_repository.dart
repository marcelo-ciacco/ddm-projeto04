import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto04/data/models/address_model.dart';
import 'package:projeto04/data/repositories/auth_repository.dart';
import 'package:projeto04/data/services/cep_service.dart';
import 'package:projeto04/data/services/product_service.dart';

import '../models/product_model.dart';

class ProductRepository {
  final ProductService productService;
  final CepService cepService;
  final AuthRepository authRepository;

  ProductRepository({
    required this.productService,
    required this.cepService,
    required this.authRepository,
  });

  Future<AddressModel> findAddressByCep(String cep) async {
    return cepService.findAddressByCep(cep);
  }

  Future<void> createProduct({
    required String name,
    required String description,
    required double price,
    required AddressModel address,
  }) async {
    final userId = authRepository.currentUserId;

    if (userId == null) {
      throw Exception('Usuario não logado');
    }

    final productModel = ProductModel(
      userId: userId,
      name: name,
      description: description,
      price: price,
      address: AddressModel(
        cep: address.cep,
        street: address.street,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
      ),
      createAt: Timestamp.now(),
    );

    await productService.createProduct(productModel);
  }

  Stream<List<ProductModel>> watchProductByUser() {
    final userId = authRepository.currentUserId;

    if (userId == null) {
      throw Exception('Usuario não logado');
    }

    return productService.watchProductByUser(userId);
  }

  Future<void> updateProduct(ProductModel product) async {
    await productService.updateProduct(product);
  }

  Future<void> deleteProduct(String productId) async {
    await productService.deleteProduct(productId);
  }
}
