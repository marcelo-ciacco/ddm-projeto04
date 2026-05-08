import 'package:dio/dio.dart';
import 'package:projeto04/data/models/address_model.dart';

class CepService {
  final Dio _dio = Dio();

  Future<AddressModel> findAddressByCep(String cep) async {
    final cleanCep = cep.replaceAll('-', '').trim();

    final response = await _dio.get('https://viacep.com.br/ws/$cleanCep/json/');

    final data = response.data;

    if (data == null || data['erro'] == "true") {
      throw Exception('CEP não encontrado');
    }

    return AddressModel.fromViaCep(data);
  }
}
