import 'package:dio/dio.dart';

import 'http_client.dart';

class DioHttpClient implements HttpClient {
  final Dio _dioInstance = Dio()
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30);

  @override
  Future<void> addHeader(Map<String, String> headers) {
    _dioInstance.options.headers = headers;
    return Future.value();
  }

  @override
  Future<HttpResponse<T>> delete<T>(String url, {data}) async {
    var response = await _dioInstance.delete(url, data: data);
    return HttpResponse(response.data, response.statusCode!);
  }

  @override
  Future<HttpResponse<T>> get<T>(String url, [Map<String, dynamic>? queryParameters]) async {
    try {
      var response = await _dioInstance.get(url, queryParameters: queryParameters);
      return HttpResponse(
        response.data,
        response.statusCode!,
      );
    } on DioException catch (e) {
      return HttpResponse(e.response?.data, e.response?.statusCode!);
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>(String url, {data}) async {
    var response = await _dioInstance.patch(url, data: data);
    return HttpResponse(response.data, response.statusCode!);
  }

  @override
  Future<HttpResponse<T>> post<T>(String url, {data}) async {
    try {
      var response = await _dioInstance.post(url, data: data);
      return HttpResponse(response.data, response.statusCode!);
    } on DioException catch (e) {
      return HttpResponse(e.response!.data, e.response!.statusCode!);
    }
  }

  @override
  Future<HttpResponse<T>> put<T>(String url, {data}) async {
    var response = await _dioInstance.put(url, data: data);
    return HttpResponse(response.data, response.statusCode!);
  }
}
