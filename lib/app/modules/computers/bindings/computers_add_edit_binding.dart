import 'package:get/get.dart';

import '../../../modules/computers/controllers/view_add_edit_computers_controller.dart';
// import '../../device_categories/controllers/device_categories_controller.dart';

class ComputersAddEditBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(DeviceCategoriesController());
    Get.put(ViewAddEditComputersController());
  }
}
