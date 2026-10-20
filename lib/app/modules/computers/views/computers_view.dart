import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/computers_controller.dart';
import '../../../../app/routes/app_pages.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../../app/data/enums/form_mode.dart';
import '../../../../app/modules/computers/widgets/computer_list_item.dart';

class ComputersView extends StatelessWidget {
  ComputersView({super.key});
  final controller = Get.find<ComputersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computers', style: TextStyle(fontWeight: FontWeight.bold)),
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
                        label: const Text('search'),
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
                            controller.getAllComputers(
                              search: controller.searchController.text,
                              isActive: controller.isActive.value,
                              // positionId: controller.positionId.value,
                            );
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
          Obx(
            () => controller.isFilterOpen.value
                ? Container(
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
                        Obx(() {
                          final sections =
                              controller.sectionsController.sections;

                          final selectedId =
                              sections.any(
                                (section) =>
                                    section.id ==
                                    controller.selectedSectionId.value,
                              )
                              ? controller.selectedSectionId.value
                              : null;

                          return DropdownButtonFormField<int>(
                            key: ValueKey(
                              'section-$selectedId-${sections.length}',
                            ),
                            initialValue: selectedId,
                            decoration: InputDecoration(
                              labelText: 'Section',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: sections.map((section) {
                              return DropdownMenuItem<int>(
                                value: section.id,
                                child: Text(section.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.selectedSectionId.value = value;

                              // Reset dependent selections
                              controller.selectedLocationId.value = null;
                              controller.selectedPositionId.value = null;

                              // Clear dependent options
                              controller.locationsController.clearLocations();
                              controller.positionsController.clearPositions();

                              if (value != null) {
                                controller.locationsController.getAllLocations(
                                  sectionId: value,
                                );
                              }
                            },
                          );
                        }),

                        const SizedBox(height: 15),

                        // LOCATION
                        Obx(() {
                          final locations =
                              controller.locationsController.locations;

                          final selectedId =
                              locations.any(
                                (location) =>
                                    location.id ==
                                    controller.selectedLocationId.value,
                              )
                              ? controller.selectedLocationId.value
                              : null;

                          return DropdownButtonFormField<int>(
                            key: ValueKey(
                              'location-${controller.selectedSectionId.value}-'
                              '$selectedId-${locations.length}',
                            ),
                            initialValue: selectedId,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: locations.map((location) {
                              return DropdownMenuItem<int>(
                                value: location.id,
                                child: Text(location.name),
                              );
                            }).toList(),
                            onChanged:
                                controller.selectedSectionId.value == null
                                ? null
                                : (value) {
                                    controller.selectedLocationId.value = value;

                                    // Reset dependent selection
                                    controller.selectedPositionId.value = null;

                                    controller.positionsController
                                        .clearPositions();

                                    if (value != null) {
                                      controller.positionsController
                                          .getAllPositions(locationId: value);
                                    }
                                  },
                          );
                        }),

                        const SizedBox(height: 15),

                        // POSITION
                        Obx(() {
                          final positions =
                              controller.positionsController.positions;

                          final selectedId =
                              positions.any(
                                (position) =>
                                    position.id ==
                                    controller.selectedPositionId.value,
                              )
                              ? controller.selectedPositionId.value
                              : null;

                          return DropdownButtonFormField<int>(
                            key: ValueKey(
                              'position-${controller.selectedLocationId.value}-'
                              '$selectedId-${positions.length}',
                            ),
                            initialValue: selectedId,
                            decoration: InputDecoration(
                              labelText: 'Position',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: positions.map((position) {
                              return DropdownMenuItem<int>(
                                value: position.id,
                                child: Text(position.name),
                              );
                            }).toList(),
                            onChanged:
                                controller.selectedLocationId.value == null
                                ? null
                                : (value) {
                                    controller.selectedPositionId.value = value;
                                  },
                          );
                        }),

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

                        // Clear Filter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Addd icon button
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.DJR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Clear Filter'),
                              onPressed: () {
                                controller.clearFilter();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),

          SizedBox(height: 10),

          // Computers List
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.computers.length,
                itemBuilder: (context, index) {
                  final computer = controller.computers[index];

                  return ComputerListItem(computer: computer);
                },
              ),
            ),
          ),
        ],
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
