import 'package:get/get.dart';

import '../../../app/data/models/user.dart';
import '../../../app/data/providers/user_provider.dart';

class UserController extends GetxController {
  var users = List<User>.empty().obs;

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
}
