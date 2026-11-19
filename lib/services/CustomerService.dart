import '../models/customer.dart';
class CustomerService {
  final List<Customer> customers;
  CustomerService({
    required this.customers,
  });
  // teanh all user , check phg na
  List<Customer> getAllCustomers() {
    return customers;
  }
  // teanh customer by id , check 
  Customer? getCustomerById(String customerId) {
    for (var customer in customers) {
      if (customer.id == customerId) {
        return customer;
      }
    }
    return null;
  }
}