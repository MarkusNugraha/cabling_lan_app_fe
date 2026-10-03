import 'package:get/get.dart';

import '../controllers/view_add_edit_users_controller.dart';

class UsersAddEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewAddEditUsersController());
  }
}
