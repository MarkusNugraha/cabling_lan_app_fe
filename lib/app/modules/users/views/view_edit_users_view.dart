import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/view_add_edit_users_controller.dart';

class ViewEditUsersView extends StatelessWidget {
  ViewEditUsersView({super.key});
  final addEditUsersController = Get.find<ViewAddEditUsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          addEditUsersController.pageTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Text('NIK', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 3),
              Obx(
                () => TextField(
                  controller: addEditUsersController.nikController,
                  enabled: !addEditUsersController.isReadOnly,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Text('Location', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 3),
              Obx(
                () => TextField(
                  controller: addEditUsersController.locationController,
                  enabled: !addEditUsersController.isReadOnly,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Text('Username', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 3),
              Obx(
                () => TextField(
                  controller: addEditUsersController.usernameController,
                  enabled: !addEditUsersController.isReadOnly,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Text('Email', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 3),
              Obx(
                () => TextField(
                  controller: addEditUsersController.emailController,
                  enabled: !addEditUsersController.isReadOnly,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (addEditUsersController.isView) {
                  return ElevatedButton(
                    onPressed: () {
                      addEditUsersController.enterEditMode();
                    },
                    child: const Text('Edit'),
                  );
                }

                return ElevatedButton(
                  onPressed: () {
                    addEditUsersController.updateUser();
                  },
                  child: const Text('Save'),
                );
              }),
              // addEditUsersController.formMode == FormMode.EDIT
              //     ? ElevatedButton(
              //         child: const Text('Save'),
              //         onPressed: () {
              //           addEditUsersController.updateUser();
              //         },
              //       )
              //     : addEditUsersController.formMode == FormMode.VIEW
              //     ? ElevatedButton(
              //         child: const Text('Edit'),
              //         onPressed: () {
              //           addEditUsersController.formMode = FormMode.EDIT;
              //         },
              //       )
              //     : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
