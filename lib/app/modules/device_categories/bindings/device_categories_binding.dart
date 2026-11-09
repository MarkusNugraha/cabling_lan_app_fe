import 'package:get/get.dart';

import '../controllers/device_categories_controller.dart';

class DeviceCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeviceCategoriesController());
  }
}
