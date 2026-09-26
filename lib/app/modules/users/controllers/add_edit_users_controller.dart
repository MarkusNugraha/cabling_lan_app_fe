import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddEditUsersController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
