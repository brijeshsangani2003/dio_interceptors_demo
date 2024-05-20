import 'package:dio_interceptors_demo/repositories/services.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class UserController extends GetxController {
  var isLoading = true;
  List<UserModel> userList = [];

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    isLoading = true;

    final userResponse = await Services().user();
    if (userResponse != null) {
      userList.assignAll(userResponse);
    }

    isLoading = false;
    update();
  }
}
