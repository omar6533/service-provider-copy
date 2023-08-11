class ApiResponse<T extends Serializable> {
  T? data;
  int? statusCode;
  String? message;

  String? status;
  dynamic error;
  ApiResponse({
    this.statusCode,
    this.data,
    this.message,
    this.status,
    this.error,
  });
  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      statusCode: json["statusCode"],
      data: json["data"] == null ? null : create(json["data"]),
      message: json["message"],
      status: json["status"],
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data?.toJson(),
        "message": message,
        "status": status,
        "error": error,
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
