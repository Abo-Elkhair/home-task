import 'package:task3/core/utilities/utilities/http/generic_http.dart';
import 'package:task3/core/utilities/utilities/utils_functions/ApiNames.dart';
import 'package:task3/features/home/data/home_model/home_model_data.dart';

class HomeDataSource {
  Future<HomeModelData> getHomeData() async {
    return await GenericHttp<dynamic>().callApi(
      name: ApiNames.home,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data['data'],
      toJsonFunc: (json) => HomeModelData.fromJson(json),
    );
  }
}
