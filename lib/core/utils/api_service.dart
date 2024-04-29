// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://kareemalaa-001-site1.mysitepanel.net/api/';

  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print(response.data);
    return response.data;
  }
}
