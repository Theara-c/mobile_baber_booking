import 'category.dart';

class EmployeeService  {
  final String id;
  final String name;
  final Category category;
  final double price;
  final Duration duration;

  const EmployeeService ({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.duration,
  });
}
