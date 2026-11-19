import 'package:barber_app/models/category.dart';

class BaberService {
  final String id;
  final String name;
  final Category category;
  final double price;
  final Duration duration;

  const BaberService({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.duration,
  });

}