import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../data/enums/form_mode.dart';
import '../../../data/services/snackbar_service.dart';
import '../../../data/providers/user_provider.dart';

class ViewAddEditUsersController extends GetxController {
  late TextEditingController nikController;
  late TextEditingController locationController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late RxBool isActive = false.obs;

  final formMode = FormMode.VIEW.obs;
  bool get isAdd => formMode.value == FormMode.ADD;
  bool get isEdit => formMode.value == FormMode.EDIT;
  bool get isView => formMode.value == FormMode.VIEW;
  bool get isReadOnly => isView;

  User? user;

  @override
  void onInit() {
    nikController = TextEditingController();
    locationController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();

    formMode.value = Get.arguments['formMode'];
    findUserById(Get.arguments['userId'].toString());

    super.onInit();
  }

  void findUserById(String id) {
    UserProvider().getUserById(id).then((value) {
      user = User(
        id: value.body['data']['id'],
        nik: value.body['data']['nik'],
        location: value.body['data']['location'],
        username: value.body['data']['username'],
        email: value.body['data']['email'],
        isActive: value.body['data']['is_active'],
      );

      nikController.text = user!.nik;
      locationController.text = user!.location;
      usernameController.text = user!.username;
      emailController.text = user!.email;
      isActive.value = user!.isActive;
    });
  }

  Future<void> updateUser() async {
    final response = await UserProvider().updateUser(
      id: Get.arguments['userId'].toString(),
      nik: nikController.text,
      location: locationController.text,
      username: usernameController.text,
      email: emailController.text,
      isActive: isActive.value,
    );

    if (response.isOk) {
      Get.back();
      SnackbarService.success("${response.body['message']}");
    } else {
      final message = response.body is Map
          ? response.body['message'] ?? 'Failed to update user'
          : 'Failed to update user';

      SnackbarService.error(message);
    }
  }

  String get pageTitle {
    switch (formMode.value) {
      case FormMode.ADD:
        return 'Add User';
      case FormMode.EDIT:
        return 'Edit User';
      case FormMode.VIEW:
        return 'View User';
    }
  }

  void enterEditMode() {
    if (isView) {
      formMode.value = FormMode.EDIT;
    }
  }

  @override
  void onClose() {
    nikController.dispose();
    locationController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
