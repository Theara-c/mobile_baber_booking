import 'package:barber_app/models/barberService.dart';
import 'package:barber_app/models/barber.dart';

class Shop {
  final String name;
  final int openHour; // 0-23
  final int closeHour; // 0-23
  final String address;
  final List<Baber> babers; // composition
  final List<BaberService> services; // composition

  Shop({
    required this.name,
    required this.openHour,
    required this.closeHour,
    required this.address,
    List<Baber>? babers,
    List<BaberService>? services,
  })  : babers = babers ?? [],
        services = services ?? [];

}