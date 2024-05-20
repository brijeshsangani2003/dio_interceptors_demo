import 'package:dio/dio.dart';
import 'package:dio_interceptors_demo/core/constants/network_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  Dio dio = Dio();
  //dio access all file
  Dio get sendRequest => dio;

  ApiServices() {
    dio.options.baseUrl = NetworkConst.baseUrl;
    // PrettyDioLogger jetli requset and function hse ene log karse.
    dio.interceptors.add(PrettyDioLogger(
      //je vastu print karavi hoy ene true api devanu.
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }
}
