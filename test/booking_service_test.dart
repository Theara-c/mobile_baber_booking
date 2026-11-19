import 'package:flutter_test/flutter_test.dart';

import '../lib/models/booking.dart';
import '../lib/models/customer.dart';
import '../lib/models/shop.dart';
import '../lib/models/EmployeeService.dart';
import '../lib/services/BookingService.dart';
import '../lib/services/CustomerService.dart';
import '../lib/services/ShopService.dart';

void main() {
  late CustomerService customerService;
  late ShopService shopService;
  late BookingService bookingService;

  setUp(() {
    final customers = [
      const Customer(
        id: 'C001',
        name: 'Dara',
        phoneNumber: '012345678',
        password: 'password123',
        favouriteShop: ['S001'],
      ),
      const Customer(
        id: 'C002',
        name: 'Sopheak',
        phoneNumber: '098765432',
        password: 'password456',
        favouriteShop: [],
      ),
    ];

    final services = [
      const EmployeeService(
        id: 'SV001',
        name: 'Haircut',
        categoryId: 'CAT001',
        price: 10.0,
        duration: Duration(minutes: 30),
      ),
      const EmployeeService(
        id: 'SV002',
        name: 'Hair Wash',
        categoryId: 'CAT002',
        price: 5.0,
        duration: Duration(minutes: 15),
      ),
      const EmployeeService(
        id: 'SV003',
        name: 'Haircut + Wash',
        categoryId: 'CAT001',
        price: 15.0,
        duration: Duration(minutes: 45),
      ),
    ];

    final shops = [
      Shop(
        shopId: 'S001',
        name: 'Happy Barber',
        openHour: 8,
        closeHour: 20,
        address: 'Phnom Penh',
        services: services,
      ),
      Shop(
        shopId: 'S002',
        name: 'Royal Barber',
        openHour: 9,
        closeHour: 21,
        address: 'Sen Sok, Phnom Penh',
        services: [
          const EmployeeService(
            id: 'SV004',
            name: 'Basic Haircut',
            categoryId: 'CAT001',
            price: 8.0,
            duration: Duration(minutes: 30),
          ),
        ],
      ),
    ];

    customerService = CustomerService(customers: customers);
    shopService = ShopService(shops: shops);
    bookingService = BookingService(
      customerService: customerService,
      shopService: shopService,
    );
  });

  final start = DateTime(2026, 11, 21, 10, 0);
  final end = DateTime(2026, 11, 21, 10, 30);

  test('TC01 - Create booking with valid customer, shop and service', () {
    final booking = bookingService.createBooking(
      customerId: 'C001',
      shopId: 'S001',
      employeeServiceId: 'SV001',
      startDate: start,
      endDate: end,
    );

    expect(booking, isNotNull);
    expect(booking!.id, 'B1');
    expect(booking.customerId, 'C001');
    expect(booking.shopId, 'S001');
    expect(booking.employeeServiceId, 'SV001');
    expect(booking.totalFee, 10.0);
    expect(booking.bookingFee, 2.0);
    expect(booking.status, BookingStatus.pending);
    expect(bookingService.bookings.length, 1);
  });

  test('TC02 - Cannot create booking with an unknown customer', () {
    final booking = bookingService.createBooking(
      customerId: 'C999',
      shopId: 'S001',
      employeeServiceId: 'SV001',
      startDate: start,
      endDate: end,
    );

    expect(booking, isNull);
    expect(bookingService.bookings, isEmpty);
  });

  test('TC03 - Cannot create booking with an unknown shop', () {
    final booking = bookingService.createBooking(
      customerId: 'C001',
      shopId: 'S999',
      employeeServiceId: 'SV001',
      startDate: start,
      endDate: end,
    );

    expect(booking, isNull);
    expect(bookingService.bookings, isEmpty);
  });

  test('TC04 - Cannot create booking with a service not in the selected shop', () {
    // SV004 belongs to S002, not S001.
    final booking = bookingService.createBooking(
      customerId: 'C001',
      shopId: 'S001',
      employeeServiceId: 'SV004',
      startDate: start,
      endDate: end,
    );

    expect(booking, isNull);
    expect(bookingService.bookings, isEmpty);
  });

  test('TC05 - Booking fee is calculated as 20 percent of service price', () {
    final booking = bookingService.createBooking(
      customerId: 'C002',
      shopId: 'S001',
      employeeServiceId: 'SV003',
      startDate: start,
      endDate: start.add(const Duration(minutes: 45)),
    );

    expect(booking, isNotNull);
    expect(booking!.totalFee, 15.0);
    expect(booking.bookingFee, 3.0);
  });

  test('TC06 - Get only bookings belonging to the requested customer', () {
    bookingService.createBooking(
      customerId: 'C001',
      shopId: 'S001',
      employeeServiceId: 'SV001',
      startDate: start,
      endDate: end,
    );
    bookingService.createBooking(
      customerId: 'C002',
      shopId: 'S001',
      employeeServiceId: 'SV002',
      startDate: start,
      endDate: start.add(const Duration(minutes: 15)),
    );

    final daraBookings = bookingService.getMyBookings('C001');
    final sopheakBookings = bookingService.getMyBookings('C002');

    expect(daraBookings.length, 1);
    expect(daraBookings.first.customerId, 'C001');
    expect(sopheakBookings.length, 1);
    expect(sopheakBookings.first.customerId, 'C002');
  });

  test('TC07 - Return an empty list when customer has no bookings', () {
    final bookings = bookingService.getMyBookings('C001');

    expect(bookings, isEmpty);
  });
}
