import 'package:get/get.dart';

import '../controllers/cables_controller.dart';

class CablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CablesController>(
      () => CablesController(),
    );
  }
}
