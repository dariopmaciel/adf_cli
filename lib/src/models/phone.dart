
import 'dart:convert';

class Phone {
  int ddd;
  String phone;
  Phone({
    required this.ddd,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'phone': phone,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] ?? 0,
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));
}
