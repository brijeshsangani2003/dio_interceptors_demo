import 'package:dio/dio.dart';
import 'package:dio_interceptors_demo/core/utils/preference.dart';

// class DioInterceptor extends Interceptor {
//   Dio dio = Dio(BaseOptions(baseUrl: "base-api-url"));
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers.addAll({
//       "Content-Type": "application/json",
//       "Authorization": "Bearer ${token}",
//     });
//     // get token from the storage
//     if (token != null) {
//       options.headers.addAll({
//         "Authorization": "Bearer ${token}",
//       });
//     }
//     return super.onRequest(options, handler);
//   }
//
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     return super.onResponse(response);
//   }
//
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     // Check if the user is unauthorized.
//     if (err.response?.statusCode == 401) {
//       // Refresh the user's authentication token.
//       await refreshToken();
//       // Retry the request.
//       try {
//         handler.resolve(await _retry(err.requestOptions));
//       } on DioException catch (e) {
//         // If the request fails again, pass the error to the next interceptor in the chain.
//         handler.next(e);
//       }
//       // Return to prevent the next interceptor in the chain from being executed.
//       return;
//     }
//     // Pass the error to the next interceptor in the chain.
//     handler.next(err);
//   }
//
//   Future<Response<dynamic>> refreshToken() async {
//     var response = await dio.post(APIs.refreshToken,
//         options: Options(
//             headers: {"Refresh-Token": "refresh-token" }));
//     // on success response, deserialize the response
//     if (response.statusCode == 200) {
//       // LoginRequestResponse requestResponse =
//       //    LoginRequestResponse.fromJson(response.data);
//       // UPDATE the STORAGE with new access and refresh-tokens
//       return response;
//     }
//   }
//
//   Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
//     // Create a new `RequestOptions` object with the same method, path, data, and query parameters as the original request.
//     final options = Options(
//       method: requestOptions.method,
//       headers: {
//         "Authorization": "Bearer ${token}",
//       },
//     );
//
//     // Retry the request with the new `RequestOptions` object.
//     return dio.request<dynamic>(requestOptions.path,
//         data: requestOptions.data,
//         queryParameters: requestOptions.queryParameters,
//         options: options);
//   }
// }
class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = preferences.token;
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    // get token from the storage
    if (token != null && token.isNotEmpty) {
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      // Request made and server responded with an error status code
      print('Error Status Code: ${err.response!.statusCode}');
      print('Error Response: ${err.response!.data}');
    } else if (err.response?.statusCode == 404) {
      print('Not Found'); // api link wrong
    } else if (err.response?.statusCode == 201) {
      print('No Content'); //means k ApiCall type wrong(get/post/put/delete).
    } else if (err.response?.statusCode == 400) {
      print('Bad Request'); //user is not authorized
    } else {
      // Something went wrong in setting up or sending the request
      print('Error: ${err.message}');
    }
    return super.onError(err, handler);
  }
}
