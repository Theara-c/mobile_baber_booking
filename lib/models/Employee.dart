class Employee {
  final String id;
  final String name;
  final String shopId;
  final String specialization;
  final int workStartHour; // 0-23
  final int workEndHour; // 0-23
  final bool isAvailable;

  const Employee({
    required this.id,
    required this.name,
    required this.shopId,
    required this.specialization,
    required this.workStartHour,
    required this.workEndHour,
    this.isAvailable = true,
  });
}