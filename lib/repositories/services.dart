import 'package:dio/dio.dart';
import 'package:dio_interceptors_demo/core/constants/network_constants.dart';
import 'package:dio_interceptors_demo/model/user_model.dart';
import 'package:dio_interceptors_demo/repositories/Api_services.dart';

class Services {
  ApiServices apiServices = ApiServices();

  Future<List<UserModel>?> user() async {
    try {
      Response response = await apiServices.sendRequest.get(NetworkConst.user);
      List<dynamic> responseData = response.data;
      List<UserModel> userData =
          responseData.map((e) => UserModel.fromJson(e)).toList();
      return userData;
    } catch (ex) {
      throw ex;
    }
  }
}
