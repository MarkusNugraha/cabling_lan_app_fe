import 'package:get/get.dart';

import '../controllers/users_controller.dart';
import '../../sections/controllers/sections_controller.dart';
import '../../locations/controllers/locations_controller.dart';
import '../../positions/controllers/positions_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SectionsController());
    Get.put(LocationsController());
    Get.put(PositionsController());
    Get.put(UsersController());
  }
}
