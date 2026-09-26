import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../data/providers/user_provider.dart';

class UsersController extends GetxController {
  var users = List<User>.empty().obs;

  final searchController = TextEditingController();
  final isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();

    getAllUsers();
    searchController.addListener(() {
      isSearching.value = searchController.text.isNotEmpty;
    });
  }

  void clearSearch() {
    searchController.clear();
  }

  void snackBarError(String msg) {
    Get.snackbar('Error', msg, duration: Duration(seconds: 2));
  }

  // User findUserById(String id) {
  //   return users.firstWhere((element) => element.id == id);
  // }

  void getAllUsers() {
    UserProvider().getAllUsers().then((value) {
      users.value = List.generate(
        value.body['data'].length,
        (index) => User(
          nik: value.body['data'][index]['nik'],
          location: value.body['data'][index]['location'],
          username: value.body['data'][index]['username'],
          email: value.body['data'][index]['email'],
          isActive: value.body['data'][index]['is_active'],
        ),
      );
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
