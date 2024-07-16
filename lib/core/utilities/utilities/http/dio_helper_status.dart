// ignore_for_file: avoid_function_literals_in_foreach_calls

part of 'dio_imports.dart';

class DioHelper {
  late Dio _dio;

  DioHelper() {
    _dio = Dio()
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (data) => log(data.toString()),
        ),
      );
  }

  Future<dynamic> get(
      {required String url, Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.get(url, queryParameters: query);
      log("response ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      showErrorMessage(e.response);
    }
    return null;
  }

  showErrorMessage(Response? response) {
    if (response == null) {
      showSnackBar("excpetion", backgroundColor: Colors.redAccent);
    } else {
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");
      var data = response.data;
      if (data is String) data = json.decode(response.data);
      switch (response.statusCode) {
        case 500:
          showSnackBar(data["message"].toString(),
              backgroundColor: Colors.redAccent);
          break;
        case 422:
          showSnackBar(data["message"].toString(),
              backgroundColor: Colors.redAccent);
          break;
        case 400:
          if (data["errors"] != null) {
            Map<String, dynamic> errors = data["errors"];
            log("response errors $errors");
            errors.forEach((key, value) {
              List<String> lst = List<String>.from(value.map((e) => e));
              lst.forEach((e) {
                showSnackBar(e, backgroundColor: Colors.redAccent);
              });
            });
          } else {
            showSnackBar(data["message"].toString(),
                backgroundColor: Colors.redAccent);
          }
          break;

        case 403:
          showSnackBar(data["message"].toString(),
              backgroundColor: Colors.redAccent);
          break;
        case 404:
          showSnackBar(data["message"].toString(),
              backgroundColor: Colors.redAccent);
          break;
      }
    }
  }
}
