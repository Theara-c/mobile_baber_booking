import '../models/booking.dart';
import 'CustomerService.dart';
import 'ShopService.dart';

class BookingService {
  final CustomerService customerService;
  final ShopService shopService;
  final List<Booking> bookings;

  BookingService({
    required this.customerService,
    required this.shopService,
    List<Booking>? bookings,
  }) : bookings = bookings ?? [];

  // 1. Create booking
  Booking? createBooking({
    required String customerId,
    required String shopId,
    required String employeeServiceId,
    required DateTime startDate,
    required DateTime endDate,
  }) {
   
    var customer = customerService.getCustomerById(customerId);

    if (customer == null) {
      return null;
    }

    var shop = shopService.getShopById(shopId);
    if (shop == null) {
      return null;
    }

    var selectedService = shop.services.where(
      (service) => service.id == employeeServiceId,
    );
    if (selectedService.isEmpty) {
      return null;
    }
    var service = selectedService.first;
    // make
    var booking = Booking(
      id: 'B${bookings.length + 1}',
      customerId: customerId,
      shopId: shopId,
      employeeId: null,
      employeeServiceId: employeeServiceId,
      totalFee: service.price,
      bookingFee: service.price * Booking.feeRate,
      status: BookingStatus.pending,
      startDate: startDate,
      endDate: endDate,
    );
    bookings.add(booking);
    return booking;
  }
  // 2. merl booking
  List<Booking> getMyBookings(String customerId) {
    return bookings.where((booking) {
      return booking.customerId == customerId;
    }).toList();
  }
}