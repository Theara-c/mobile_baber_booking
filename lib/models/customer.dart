import 'shop.dart';

class Customer {
  final String id;
  final String name;
  final String phoneNumber;
  final String password; 
  final List<String> favouriteShop;

  const Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.password, required this.favouriteShop,
  });

}