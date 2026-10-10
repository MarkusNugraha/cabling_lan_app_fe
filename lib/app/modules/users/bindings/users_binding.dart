import 'package:get/get.dart';

import '../controllers/users_controller.dart';
import '../../sections/controllers/sections_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SectionsController());
    Get.put(UsersController());
  }
}
