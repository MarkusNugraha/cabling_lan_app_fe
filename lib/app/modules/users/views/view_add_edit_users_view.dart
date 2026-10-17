import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/view_add_edit_users_controller.dart';
import '../../../../app/modules/users/widgets/user_form_text_field.dart';
import '../../../../app/modules/users/widgets/user_form_switch_field.dart';

class ViewAddEditUsersView extends StatelessWidget {
  ViewAddEditUsersView({super.key});
  final addEditUsersController = Get.find<ViewAddEditUsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            addEditUsersController.pageTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => UserFormTextField(
                  label: 'NIK',
                  controller: addEditUsersController.nikController,
                  enabled: !addEditUsersController.isReadOnly,
                ),
              ),
              Obx(
                () => UserFormTextField(
                  label: 'Location',
                  controller: addEditUsersController.locationController,
                  enabled: !addEditUsersController.isReadOnly,
                ),
              ),
              Obx(
                () => UserFormTextField(
                  label: 'Username',
                  controller: addEditUsersController.usernameController,
                  enabled: !addEditUsersController.isReadOnly,
                ),
              ),
              Obx(
                () => UserFormTextField(
                  label: 'Email',
                  controller: addEditUsersController.emailController,
                  enabled: !addEditUsersController.isReadOnly,
                ),
              ),
              if (addEditUsersController.isView)
                Obx(
                  () => UserFormSwitchField(
                    label: 'Is Active',
                    value: addEditUsersController.isActive,
                    enabled: !addEditUsersController.isReadOnly,
                  ),
                ),
              if (addEditUsersController.isAdd)
                Obx(
                  () => UserFormTextField(
                    label: 'Password',
                    controller: addEditUsersController.passwordController,
                    enabled: !addEditUsersController.isReadOnly,
                    obscureText: true,
                  ),
                ),
              Obx(() {
                if (addEditUsersController.isView) {
                  return ElevatedButton(
                    onPressed: () {
                      addEditUsersController.enterEditMode();
                    },
                    child: const Text('Edit'),
                  );
                } else if (addEditUsersController.isEdit) {
                  return ElevatedButton(
                    onPressed: () {
                      addEditUsersController.updateUser();
                    },
                    child: const Text('Save'),
                  );
                } else if (addEditUsersController.isAdd) {
                  return ElevatedButton(
                    onPressed: () {
                      addEditUsersController.addUser();
                    },
                    child: const Text('Submit'),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
