import '../models/shop.dart';
import '../models/EmployeeService.dart';
class ShopService {
  final List<Shop> shops;
  ShopService({required this.shops});
  // teanh all , check phg
  List<Shop> getAllShops() {
    return shops;
  }
  // rk by id , chrck phg
  Shop? getShopById(String shopId) {
    for (var shop in shops) {
      if (shop.shopId == shopId) {
        return shop;
      }
    }
    return null;
  }
  // rk service by iD , check pg
  EmployeeService? getEmployeeServiceById(String serviceId) {
    for (var shop in shops) {
      for (var service in shop.services) {
        if (service.id == serviceId) {
          return service;
        }
      }
    }
    return null;
  }
}