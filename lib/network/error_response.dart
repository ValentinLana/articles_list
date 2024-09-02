import 'dart:convert';
import 'dart:io';

class ErrorResponse {
  final int? statusCode;

  final List<String> message;
  final String error;
  ErrorResponse({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json["statusCode"],
      message: List<String>.from(json["message"] is Map<String, dynamic>
          ? json["message"].map((x) => (x as SocketException).message)
          : [(json["message"] as SocketException).message]),
      error: json["error"],
    );
  }

  factory ErrorResponse.fromRawJson(String str) => ErrorResponse.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": List<dynamic>.from(message.map((x) => x)),
        "error": error,
      };

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.noInternet() {
  return ErrorResponse(
    statusCode: 503,
    message: ['No Internet connection'],
    error: 'No Internet Connection',
  );
}
}
