import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto04/data/models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _collection {
    return _firestore.collection('products');
  }

  Future<void> createProduct(ProductModel product) async {
    await _collection.add(product.toMap());
  }

  Stream<List<ProductModel>> watchProductByUser(String userId) {
    return _collection.where('userId', isEqualTo: userId).snapshots().map((
      snapshot,
    ) {
      final products = snapshot.docs.map((doc) {
        return ProductModel.fromMap(
          uid: doc.id,
          map: doc.data(),
        );
      }).toList();

      products.sort((a, b) => b.createAt.compareTo(a.createAt));

      return products;
    });
  }

  Future<void> updateProduct(ProductModel product) async {
    if (product.uid == null) {
      throw Exception('Produto sem ID');
    }

    /* final updateProduct = product.copyWith(
      name: 
    );*/

    await _collection.doc(product.uid).update(product.toMap());
  }

  Future<void> deleteProduct(String productId) async {
    await _collection.doc(productId).delete();
  }
}
