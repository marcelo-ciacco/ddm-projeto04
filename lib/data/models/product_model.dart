import 'package:cloud_firestore/cloud_firestore.dart';

import 'address_model.dart';

class ProductModel {
  final String? uid;
  final String userId;
  final String name;
  final String description;
  final double price;
  final AddressModel address;
  final Timestamp createAt;

  ProductModel({
    this.uid,
    required this.userId,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.createAt,
  });

  factory ProductModel.fromMap({
    required String uid,
    required Map<String, dynamic> map,
  }) {
    return ProductModel(
      uid: uid,
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      address: AddressModel.fromMap(map['address'] ?? {}),
      createAt: map['createAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'description': description,
      'price': price,
      'address': {
        'cep': address.cep,
        'street': address.street,
        'neighborhood': address.neighborhood,
        'city': address.city,
        'state': address.state,
      },
      'createAt': createAt,
    };
  }

  ProductModel copyWith({
    String? uid,
    String? userId,
    String? name,
    String? description,
    double? price,
    AddressModel? address,
    Timestamp? createAt,
  }) {
    return ProductModel(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      address: address ?? this.address,
      createAt: createAt ?? this.createAt,
    );
  }
}
