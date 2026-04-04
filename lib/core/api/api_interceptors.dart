import 'package:celus_fe/core/api/end_ponits.dart';
import 'package:celus_fe/core/models/login_model.dart';
import 'package:celus_fe/helper/login_operation.dart';
import 'package:celus_fe/helper/token_operation.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;

  ApiInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
// 1. Get the token without the fallback text
    final token = TokenStorage.getAccessToken();

    // 2. Only add the header if the token actually exists and isn't empty
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    // final token = TokenStorage.getAccessToken() ?? 'null';

    // options.headers.addAll({
    //   if(token != 'null')
    //   'Authorization': 'Bearer $token',
    // });
    
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      final refreshed = await _refreshToken();

      if (refreshed == true) {
        final RequestOptions requestOptions = err.requestOptions;
        final newToken = TokenStorage.getAccessToken();
        requestOptions.headers['Authorization'] = 'Bearer $newToken';
        try {
          final response = await dio.fetch(requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.reject(err);
        }
      } else {
        // refresh token failed → logout
        await TokenStorage.clearTokens();
      }
    }

    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final refreshDio = Dio(
      BaseOptions(baseUrl: EndPoint.baseUrl),
    ); // ← بدون interceptors أبداً

    try {
      LoginModel loginModel =
          LoginOperation.getLoginModel() ??
          LoginModel(username: 'Heilaaa', password: 'helloaa');
      final response = await refreshDio.post(
        EndPoint.signIn,
        data: loginModel.toJson(),
      );
      Map<String, dynamic> data = response.data;
      LoginModel loginResponse = LoginModel.fromJson(data);
      final newAccessToken = loginResponse.token ?? '';
      final newRefreshToken = loginResponse.refreshToken ?? '';

      await TokenStorage.saveAccessToken(newAccessToken);
      await TokenStorage.saveRefreshToken(newRefreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }
}
