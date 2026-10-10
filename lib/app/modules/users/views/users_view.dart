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
      body: Obx(
        () => Column(
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
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              controller.getAllUsers();
                            },
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 40,
                          ),
                          suffixIcon: controller.isSearching.value
                              ? IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    controller.clearSearch();
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
                InkWell(
                  onTap: controller.toggleFilter,
                  child: Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: controller.isFilterOpen.value
                              ? Colors.black
                              : AppColors.DJR,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: Icon(
                            controller.isFilterOpen.value
                                ? Icons.filter_list_off
                                : Icons.filter_list,
                            size: 25,
                          ),
                          color: Colors.white,
                          onPressed: controller.toggleFilter,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Filter Container
            if (controller.isFilterOpen.value)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.DJR),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // SECTION
                    Obx(
                      () => DropdownButtonFormField<int>(
                        initialValue: controller.selectedSectionId.value,
                        decoration: InputDecoration(
                          labelText: 'Section',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: controller.sectionsController.sections.map((
                          section,
                        ) {
                          return DropdownMenuItem<int>(
                            value: section.id,
                            child: Text(section.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedSectionId.value = value;

                          // Reset child filters
                          controller.selectedLocationId.value = null;
                          controller.selectedPositionId.value = null;

                          // Load locations for selected section
                          // controller.getLocationsBySection(value);
                        },
                      ),
                    ),

                    const SizedBox(height: 15),

                    // LOCATION
                    Obx(
                      () => DropdownButtonFormField<int>(
                        initialValue: controller.selectedLocationId.value,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: controller.locations.map((location) {
                          return DropdownMenuItem<int>(
                            value: location.id,
                            child: Text(location.name),
                          );
                        }).toList(),
                        onChanged: controller.selectedSectionId.value == null
                            ? null
                            : (value) {
                                controller.selectedLocationId.value = value;

                                // Reset position
                                controller.selectedPositionId.value = null;

                                // controller.sectionsController.getAllSections();
                              },
                      ),
                    ),

                    const SizedBox(height: 15),

                    // POSITION
                    Obx(
                      () => DropdownButtonFormField<int>(
                        initialValue: controller.selectedPositionId.value,
                        decoration: InputDecoration(
                          labelText: 'Position',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: controller.positions.map((position) {
                          return DropdownMenuItem<int>(
                            value: position.id,
                            child: Text(position.name),
                          );
                        }).toList(),
                        onChanged: controller.selectedLocationId.value == null
                            ? null
                            : (value) {
                                controller.selectedPositionId.value = value;
                              },
                      ),
                    ),

                    const SizedBox(height: 15),

                    // IS ACTIVE
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: controller.isActive.value,
                            onChanged: (value) {
                              controller.isActive.value = value ?? false;
                            },
                          ),
                          const Text('Is Active'),
                        ],
                      ),
                    ),
                  ],
                ),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.DJR,
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed(
          Routes.ADD_EDIT_USERS,
          arguments: {'formMode': FormMode.ADD},
        ),
      ),
    );
  }
}
