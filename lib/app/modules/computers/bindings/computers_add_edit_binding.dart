import 'package:get/get.dart';

import '../../../modules/computers/controllers/view_add_edit_computers_controller.dart';

class ComputersAddEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewAddEditComputersController());
  }
}
