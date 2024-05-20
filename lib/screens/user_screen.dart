import 'package:dio_interceptors_demo/core/constants/app_string.dart';
import 'package:dio_interceptors_demo/getx_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/size.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<UserController>(
          init: UserController(),
          builder: (userController) {
            if (userController.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  const SizedBox(height: Sizes.s25),
                  const Center(
                    child: Text(
                      AppString.userScreen,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: Sizes.s25),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [
                              const Text(
                                AppString.id,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.s17,
                                ),
                              ),
                              Text(
                                  userController.userList[index].id.toString()),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              const Text(
                                AppString.userName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.s17,
                                ),
                              ),
                              Text(userController.userList[index].name
                                  .toString()),
                            ],
                          ),
                        );
                      },
                      itemCount: userController
                          .userList.length, // Use null-aware operator
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
