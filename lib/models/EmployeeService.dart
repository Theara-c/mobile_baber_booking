import 'category.dart';

class EmployeeService  {
  final String id;
  final String name;
    final String categoryId;
  final double price;
  final Duration duration;

  const EmployeeService ({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.duration,
  });
}
