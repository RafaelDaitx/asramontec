import 'package:dio/dio.dart';

import '../models/result_cep.dart';
//
//      VIA HTTP
//
//  class ViaCepService {
//   static Future<ResultCep> fetchCep({String? cep}) async {
//     final Uri uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       return ResultCep.fromJson(response.body);
//     } else {
//       throw Exception('Requisição inválida!');
//     }
//   }
// }

//   VIA DIO
class ViaCepService {
  static Future<ResultCep> gethttp(String? cep) async {
    late Response response;
    response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    return ResultCep.fromMap(response.data);
  }
}
