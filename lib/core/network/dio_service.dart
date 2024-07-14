import 'package:dio/dio.dart';

abstract class DioService {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        //responseBody: true,
        error: true,
      ));
  }

  static Future<Response> getData({
    required String path,
  }) async {
    return await dio.get(
      path,
      options: Options(headers: {'language': 'ar'}),
    );
  }
}
