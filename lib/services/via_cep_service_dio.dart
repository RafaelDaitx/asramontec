import 'package:dio/dio.dart';

import '../models/result_cep.dart';

class ViaCepServiceDio {
  static Future<ResultCep>? fetchCep({String? cep}) async {
    var uri = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    if (uri.statusCode == 200) {
      return ResultCep.fromJson(uri.data.toString());
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
