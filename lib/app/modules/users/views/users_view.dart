import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/users_controller.dart';
import '../../../../app/routes/app_pages.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../../app/data/enums/form_mode.dart';

class UsersView extends StatelessWidget {
  UsersView({super.key});
  final controller = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // Search Input
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: Obx(
                    () => TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        label: const Text('Name / NIK'),
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        prefixIcon: const Icon(Icons.search, size: 25),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                        suffixIcon: controller.isSearching.value
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  controller.searchController.clear();
                                },
                              )
                            : null,
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 10,
                        ),
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
                ),
              ),

              // Filter Icon
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.DJR,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list, size: 25),
                    color: Colors.white,
                    onPressed: () {
                      controller.clearSearch();
                    },
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          // Users List
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];

                  return InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.DJR,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: isSelected ? AppColors.DJR : Colors.white,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // List Item Card
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.users[index].username,
                                    style: TextStyle(
                                      // color: isSelected
                                      //     ? Colors.white
                                      //     : Colors.black,
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    controller.users[index].email,
                                    style: TextStyle(
                                      // color: isSelected
                                      //     ? Colors.white
                                      //     : Colors.black,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // NIK
                            Text(
                              controller.users[index].nik,
                              style: TextStyle(
                                // color: isSelected ? Colors.white : Colors.black,
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(
                        Routes.ADD_EDIT_USERS,
                        arguments: {
                          'formMode': FormMode.VIEW,
                          'userId': user.id,
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
