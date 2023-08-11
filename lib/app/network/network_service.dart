import 'package:cloundry_care/app/flavors/build_config.dart';
import 'package:cloundry_care/app/flavors/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'network_request.dart';
import 'network_response.dart';
import 'prepared_network_request.dart';
import 'pretty_dio_logger.dart';

Future<NetworkResponse<Model>> executeRequest<Model>(
  PreparedNetworkRequest request,
) async {
  try {
    dynamic body = request.request.data.whenOrNull(
      json: (data) => data,
      text: (data) => data,
    );
    final response = await request.dio.request(
      request.request.path,
      data: body,
      queryParameters: request.request.queryParams,
      options: Options(
        method: request.request.type.name,
        headers: request.headers,
      ),
      onSendProgress: request.onSendProgress,
      onReceiveProgress: request.onReceiveProgress,
    );
    return NetworkResponse.ok(request.parser(response.data));
  } on DioError catch (error) {
    final errorText = error.toString();
    if (error.requestOptions.cancelToken?.isCancelled ?? false) {
      return NetworkResponse.noData(errorText);
    }
    switch (error.response?.statusCode) {
      case 400:
        return NetworkResponse.badRequest(errorText);
      case 401:
        // var isRefreshed = await refreshToken();
        // if (isRefreshed == false) {
        //   return NetworkResponse.noAuth(errorText);
        // }
        // return executeRequest(request);

        return NetworkResponse.noAuth(errorText);

      case 403:
        return NetworkResponse.noAccess(errorText);
      case 404:
        return NetworkResponse.notFound(errorText);
      case 409:
        return NetworkResponse.conflict(errorText);
      default:
        return NetworkResponse.noData(errorText);
    }
  } catch (error) {
    return NetworkResponse.noData(error.toString());
  }
}

// Future<bool> refreshToken() async {
//   var box = GetStorage();
//   LoginResponse? currentUser = box.read(currentUserKey) == null
//       ? null
//       : LoginResponse.fromJson(
//           jsonDecode(
//             box.read(currentUserKey),
//           ),
//         );
//   var refreshToken = currentUser?.refreshToken ?? '';
//   if (refreshToken.isEmpty) {
//     return false;
//   }
//   var isRefreshed = false;
//   await NetworkService().execute(
//       NetworkRequest(
//         type: NetworkRequestType.POST,
//         path: AppEndPoints.registerUser,
//         data: NetworkRequestBody.json({"token": refreshToken}),
//       ), (response) {
//     return ApiResponse.fromJson(response, (p0) => LoginResponse.fromJson(p0));
//   }).then((value) {
//     value.when(
//       ok: (data) async {
//         if (data is LoginResponse) {
//           var refreshToken = data.refreshToken ?? '';
//           var token = data.token ?? '';
//           currentUser?.refreshToken = refreshToken;
//           currentUser?.token = token;
//           var userEncoded = jsonEncode(currentUser?.toJson() ?? {});
//           await box.write(currentUserKey, userEncoded);
//           isRefreshed = true;
//         } else {
//           isRefreshed = false;
//         }
//       },
//       invalidParameters: (message) {
//         debugPrint("invalidParameters : $message");
//         isRefreshed = false;
//       },
//       noAuth: (message) {
//         debugPrint("noAuth : $message");
//         Fluttertoast.showToast(
//           msg: 'Your Session Has Expired Please Login Again To Proceed'.tr.tr,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//         Get.to(() => const LoginView());
//         isRefreshed = false;
//       },
//       noAccess: (message) {
//         debugPrint("noAccess : $message");
//         isRefreshed = false;
//       },
//       badRequest: (message) {
//         debugPrint("badRequest : $message");

//         isRefreshed = false;
//       },
//       notFound: (message) {
//         debugPrint("notFound : $message");
//         isRefreshed = false;
//       },
//       conflict: (message) {
//         debugPrint("conflict : $message");
//         isRefreshed = false;
//       },
//       noData: (message) {
//         debugPrint("noData : $message");
//         isRefreshed = false;
//       },
//     );
//   });
//   return isRefreshed;
// }

class AccessTokenResponse {
  String? accessToken;
  AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }
}

class NetworkService {
  static const int _maxLineWidth = 90;

  static final String baseUrl = BuildConfig.instance.config.baseUrl;
  final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: BuildConfig.instance.environment == Environment.development,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  Dio? _dio;

  late final Map<String, String> _headers;

  NetworkService({
    dioClient,
    httpHeaders,
  })  : _dio = dioClient,
        _headers = httpHeaders ?? {};

  void addBasicAuth(String accessToken) {
    _headers['Authorization'] = 'Bearer $accessToken';
  }

  Future<NetworkResponse<Model>> execute<Model>(
    NetworkRequest request,
    Model Function(Map<String, dynamic>) parser, {
    bool? needAuthorization,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio ??= await _getDefaultDioClient();
    _dio!.interceptors.clear();
    _dio!.interceptors.add(_prettyDioLogger);
    // if (needAuthorization == true) {
    //   var box = GetStorage();
    //   LoginResponse? currentUser = box.read(currentUserKey) == null
    //       ? null
    //       : LoginResponse.fromJson(
    //           jsonDecode(
    //             box.read(currentUserKey),
    //           ),
    //         );
    //   addBasicAuth(currentUser?.token ?? '');
    // }
    final req = PreparedNetworkRequest<Model>(
      request,
      parser,
      _dio!,
      {..._headers, ...(request.headers ?? {})},
      onSendProgress,
      onReceiveProgress,
    );
    final result = await compute(
      executeRequest<Model>,
      req,
    );
    return result;
  }

  Future<Dio> _getDefaultDioClient() async {
    _headers['content-type'] = 'application/json; charset=utf-8';
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.headers = _headers
      ..options.connectTimeout = 5000 // 5 seconds
      ..options.receiveTimeout = 3000;
    return dio;
  }
}
