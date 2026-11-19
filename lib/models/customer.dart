import 'package:barber_app/models/shop.dart';

class Customer {
  final String id;
  final String name;
  final String phoneNumber;
  final String password; 
  final List<Shop> favouriteShop;

  const Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.password, required this.favouriteShop,
  });

  Customer copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? password,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password, favouriteShop: [],
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        password: json['password'] as String, favouriteShop: [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}