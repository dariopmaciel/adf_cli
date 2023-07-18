import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/course.dart';

class ProductRepository {
  Future<Course> findByName(String name) async {
    final response =
        await http.get(Uri.parse('http://10.0.0.106:8080/products?name=$name'));

    if (response.statusCode != 200) {
      throw Exception();
    }

    //DECODIFICAR
    final responseData = jsonDecode(response.body);

    //DESERIALIZAR PARA UM MAPA DE CHAVE VALOR
    if (responseData.isEmpty) {
      throw Exception("PRODUTO NÃO ENCONTRADO!");
    }
    // para e retorna caso, primeiro erro encontrado
    // return Course.fromMap(responseData[0]);
    // //OU
    return Course.fromMap(responseData.first);
  }
}
