// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://newsapi.org/v2/everything';
  final Dio _dio;
  ApiService(
    this._dio,
  );
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var responce = await _dio.get('$_baseUrl$endPoint');
    return responce.data;
  }
}
