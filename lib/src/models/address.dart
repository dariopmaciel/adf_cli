

import 'dart:convert';



import 'city.dart';
import 'phone.dart';

class Address {
  final String street;
  final int number;
  final String zipCode;
  final City city;
  final Phone phone;

  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] ?? '',
      number: map['number'] ?? 0,
      zipCode: map['zipCode'] ?? '',
      city: City.fromMap(map['city'] as Map<String, dynamic>),
      phone: Phone.fromMap(map['phone'] ?? Map<String, dynamic>),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Address.fromJson(String json) =>
      Address.fromMap(jsonDecode(json) as Map<String, dynamic>);
}