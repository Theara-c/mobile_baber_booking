import 'EmployeeService.dart';
import 'Employee.dart';
class Shop {
  final String shopId ;
  final String name;
  final int openHour; // 0-23
  final int closeHour; // 0-23
  final String address;
  final List<Employee> employees; // composition
  final List<EmployeeService> services; // composition

  Shop({
    required this.shopId,
    required this.name,
    required this.openHour,
    required this.closeHour,
    required this.address,
    List<Employee>? employees,
    List<EmployeeService>? services,
  })  : employees = employees ?? [],
        services = services ?? [];

}