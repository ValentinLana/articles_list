abstract class HttpClient {
  Future<void> addHeader(Map<String, String> headers);

  Future<HttpResponse<T>> delete<T>(
    String url, {
    data,
  });

  Future<HttpResponse<T>> get<T>(String url,
      [Map<String, dynamic>? queryParameters]);

  Future<HttpResponse<T>> patch<T>(
    String url, {
    data,
  });

  Future<HttpResponse<T>> post<T>(
    String url, {
    data,
  });

  Future<HttpResponse<T>> put<T>(
    String url, {
    data,
  });
}

class HttpResponse<T> {
  final T data;
  final int? statusCode;

  HttpResponse(
    this.data,
    this.statusCode,
  );

  bool isOk() {
    return statusCode == 200;
  }
}
