enum BookingStatus { pending }

class Booking {
  static const double feeRate = 0.20;

  final String id;
  final String baberId;
  final String customerId;
  final String baberServiceId;
  final double bookingFee; 
  final double totalFee;
  final BookingStatus status;
  final DateTime startDate;
  final DateTime endDate;

  const Booking({
    required this.id,
    required this.baberId,
    required this.customerId,
    required this.baberServiceId,
    required this.bookingFee,
    required this.totalFee,
    required this.status,
    required this.startDate,
    required this.endDate,
  });
}
