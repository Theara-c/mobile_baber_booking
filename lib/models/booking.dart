enum BookingStatus { pending }

class Booking {
  static const double feeRate = 0.20;

  final String id;
  final String employeeId;
  final String customerId;
  final String employeeServiceId;
  final double bookingFee; 
  final double totalFee;
  final BookingStatus status;
  final DateTime startDate;
  final DateTime endDate;

  const Booking({
    required this.id,
    required this.employeeId,
    required this.customerId,
    required this.employeeServiceId,
    required this.bookingFee,
    required this.totalFee,
    required this.status,
    required this.startDate,
    required this.endDate,
  });
}
