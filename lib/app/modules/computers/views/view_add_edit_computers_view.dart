import 'package:cabling_lan_app/app/modules/computers/widgets/custom_dropdow.dart';
import 'package:cabling_lan_app/app/modules/computers/widgets/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/view_add_edit_computers_controller.dart';
import '../../../../app/modules/users/widgets/user_form_text_field.dart';
import '../../../../app/modules/users/widgets/user_form_switch_field.dart';
import '../../../../app/modules/computers/widgets/section_location_position_dropdown.dart';

class ViewAddEditComputersView extends StatelessWidget {
  ViewAddEditComputersView({super.key});
  final viewAddEditComputersController =
      Get.find<ViewAddEditComputersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            viewAddEditComputersController.pageTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: viewAddEditComputersController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserFormTextField(
                  label: 'ID Asset',
                  controller: viewAddEditComputersController.idAssetController,
                  isEnabled: viewAddEditComputersController.isAdd,
                  isReadOnly: !viewAddEditComputersController.isAdd,
                  isMandatory: true,
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'PC Name',
                    controller: viewAddEditComputersController.pcNameController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: false,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Serial Number',
                    controller:
                        viewAddEditComputersController.serialNumberController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),

                // Obx(
                //   () => UserFormTextField(
                //     label: 'Device Category',
                //     controller:
                //         viewAddEditComputersController.deviceCategoryController,
                //     isEnabled: !viewAddEditComputersController.isReadOnly,
                //     isMandatory: true,
                //   ),
                // ),
                // Obx(() {
                //   final deviceCategories = viewAddEditComputersController
                //       .deviceCategoriesController
                //       .deviceCategories;

                //   final selectedId =
                //       deviceCategories.any(
                //         (deviceCategory) =>
                //             deviceCategory.id ==
                //             viewAddEditComputersController
                //                 .selectedDeviceCategoryId
                //                 .value,
                //       )
                //       ? viewAddEditComputersController
                //             .selectedDeviceCategoryId
                //             .value
                //       : null;

                //   return CustomDropdown(
                //     label: 'Device Category',
                //     selectedId: selectedId,
                //     dropdownKey:
                //         'deviceCategory-$selectedId-${deviceCategories.length}',
                //     items: deviceCategories.map((deviceCategory) {
                //       return DropdownMenuItem<int>(
                //         value: deviceCategory.id,
                //         child: Text(deviceCategory.name),
                //       );
                //     }).toList(),
                //     onChanged: viewAddEditComputersController.isReadOnly
                //         ? null
                //         : (value) {
                //             viewAddEditComputersController
                //                     .selectedDeviceCategoryId
                //                     .value =
                //                 value;
                //           },
                //   );
                // }),
                Obx(() {
                  final deviceCategories = viewAddEditComputersController
                      .deviceCategoriesController
                      .deviceCategories;

                  final selectedId =
                      deviceCategories.any(
                        (category) =>
                            category.id ==
                            viewAddEditComputersController
                                .selectedDeviceCategoryId
                                .value,
                      )
                      ? viewAddEditComputersController
                            .selectedDeviceCategoryId
                            .value
                      : null;

                  return CustomDropdownField(
                    label: 'Device Category',
                    selectedId: selectedId,
                    dropdownKey:
                        'deviceCategory-$selectedId-${deviceCategories.length}',
                    items: deviceCategories.map((category) {
                      return DropdownMenuItem<int>(
                        value: category.id,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: viewAddEditComputersController.isReadOnly
                        ? null
                        : (value) {
                            viewAddEditComputersController
                                    .selectedDeviceCategoryId
                                    .value =
                                value;
                          },
                    isMandatory: true,
                  );
                }),

                // Obx(
                //   () => UserFormTextField(
                //     label: 'Position',
                //     controller:
                //         viewAddEditComputersController.positionController,
                //     isEnabled: !viewAddEditComputersController.isReadOnly,
                //     isMandatory: true,
                //   ),
                // ),
                // SECTION
                // Obx(() {
                //   final sections = viewAddEditComputersController
                //       .sectionsController
                //       .sections;

                //   final selectedId =
                //       sections.any(
                //         (section) =>
                //             section.id ==
                //             viewAddEditComputersController
                //                 .selectedSectionId
                //                 .value,
                //       )
                //       ? viewAddEditComputersController.selectedSectionId.value
                //       : null;

                //   return SizedBox(
                //     height: 50,
                //     child: DropdownButtonFormField<int>(
                //       key: ValueKey('section-$selectedId-${sections.length}'),
                //       initialValue: selectedId,
                //       decoration: InputDecoration(
                //         labelText: 'Section',
                //         contentPadding: const EdgeInsets.symmetric(
                //           horizontal: 12,
                //           vertical: 10,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //       style: const TextStyle(fontSize: 14, color: Colors.black),
                //       items: sections.map((section) {
                //         return DropdownMenuItem<int>(
                //           value: section.id,
                //           child: Text(section.name),
                //         );
                //       }).toList(),
                //       onChanged: (value) {
                //         viewAddEditComputersController.selectedSectionId.value =
                //             value;

                //         // Reset dependent selections
                //         viewAddEditComputersController
                //                 .selectedLocationId
                //                 .value =
                //             null;
                //         viewAddEditComputersController
                //                 .selectedPositionId
                //                 .value =
                //             null;

                //         // Clear dependent options
                //         viewAddEditComputersController.locationsController
                //             .clearLocations();
                //         viewAddEditComputersController.positionsController
                //             .clearPositions();

                //         if (value != null) {
                //           viewAddEditComputersController.locationsController
                //               .getAllLocations(sectionId: value);
                //         }
                //       },
                //     ),
                //   );
                // }),

                // const SizedBox(height: 15),

                // // LOCATION
                // Obx(() {
                //   final locations = viewAddEditComputersController
                //       .locationsController
                //       .locations;

                //   final selectedId =
                //       locations.any(
                //         (location) =>
                //             location.id ==
                //             viewAddEditComputersController
                //                 .selectedLocationId
                //                 .value,
                //       )
                //       ? viewAddEditComputersController.selectedLocationId.value
                //       : null;

                //   return SizedBox(
                //     height: 50,
                //     child: DropdownButtonFormField<int>(
                //       key: ValueKey(
                //         'location-${viewAddEditComputersController.selectedSectionId.value}-'
                //         '$selectedId-${locations.length}',
                //       ),
                //       initialValue: selectedId,
                //       decoration: InputDecoration(
                //         labelText: 'Location',
                //         contentPadding: const EdgeInsets.symmetric(
                //           horizontal: 12,
                //           vertical: 10,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //       style: const TextStyle(fontSize: 14, color: Colors.black),
                //       items: locations.map((location) {
                //         return DropdownMenuItem<int>(
                //           value: location.id,
                //           child: Text(location.name),
                //         );
                //       }).toList(),
                //       onChanged:
                //           viewAddEditComputersController
                //                   .selectedSectionId
                //                   .value ==
                //               null
                //           ? null
                //           : (value) {
                //               viewAddEditComputersController
                //                       .selectedLocationId
                //                       .value =
                //                   value;

                //               // Reset dependent selection
                //               viewAddEditComputersController
                //                       .selectedPositionId
                //                       .value =
                //                   null;

                //               viewAddEditComputersController.positionsController
                //                   .clearPositions();

                //               if (value != null) {
                //                 viewAddEditComputersController
                //                     .positionsController
                //                     .getAllPositions(locationId: value);
                //               }
                //             },
                //     ),
                //   );
                // }),

                // const SizedBox(height: 15),

                // // POSITION
                // Obx(() {
                //   final positions = viewAddEditComputersController
                //       .positionsController
                //       .positions;

                //   final selectedId =
                //       positions.any(
                //         (position) =>
                //             position.id ==
                //             viewAddEditComputersController
                //                 .selectedPositionId
                //                 .value,
                //       )
                //       ? viewAddEditComputersController.selectedPositionId.value
                //       : null;

                //   return SizedBox(
                //     height: 50,
                //     child: DropdownButtonFormField<int>(
                //       key: ValueKey(
                //         'position-${viewAddEditComputersController.selectedLocationId.value}-'
                //         '$selectedId-${positions.length}',
                //       ),
                //       initialValue: selectedId,
                //       decoration: InputDecoration(
                //         labelText: 'Position',
                //         contentPadding: const EdgeInsets.symmetric(
                //           horizontal: 12,
                //           vertical: 10,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //       style: const TextStyle(fontSize: 14, color: Colors.black),
                //       items: positions.map((position) {
                //         return DropdownMenuItem<int>(
                //           value: position.id,
                //           child: Text(position.name),
                //         );
                //       }).toList(),
                //       onChanged:
                //           viewAddEditComputersController
                //                   .selectedLocationId
                //                   .value ==
                //               null
                //           ? null
                //           : (value) {
                //               viewAddEditComputersController
                //                       .selectedPositionId
                //                       .value =
                //                   value;
                //             },
                //     ),
                //   );
                // }),
                Obx(
                  () => SectionLocationPositionDropdown(
                    sectionsController:
                        viewAddEditComputersController.sectionsController,
                    locationsController:
                        viewAddEditComputersController.locationsController,
                    positionsController:
                        viewAddEditComputersController.positionsController,

                    selectedSectionId:
                        viewAddEditComputersController.selectedSectionId,
                    selectedLocationId:
                        viewAddEditComputersController.selectedLocationId,
                    selectedPositionId:
                        viewAddEditComputersController.selectedPositionId,

                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Hostname',
                    controller:
                        viewAddEditComputersController.hostnameController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'CPU',
                    controller: viewAddEditComputersController.cpuController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'RAM (GB)',
                    controller: viewAddEditComputersController.ramGbController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Storage (GB)',
                    controller:
                        viewAddEditComputersController.storageGbController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Storage Type',
                    controller:
                        viewAddEditComputersController.storageTypeController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Operating System',
                    controller: viewAddEditComputersController
                        .operatingSystemController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'IP Address',
                    controller:
                        viewAddEditComputersController.ipAddressController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'MAC Address',
                    controller:
                        viewAddEditComputersController.macAddressController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Manufacturer',
                    controller:
                        viewAddEditComputersController.manufacturerController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Model',
                    controller: viewAddEditComputersController.modelController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: true,
                  ),
                ),
                Obx(
                  () => UserFormTextField(
                    label: 'Note',
                    controller: viewAddEditComputersController.noteController,
                    isEnabled: !viewAddEditComputersController.isReadOnly,
                    isMandatory: false,
                  ),
                ),
                if (viewAddEditComputersController.isView)
                  Obx(
                    () => UserFormSwitchField(
                      label: 'Is Active',
                      value: viewAddEditComputersController.isActive,
                      isEnabled: !viewAddEditComputersController.isReadOnly,
                    ),
                  ),
                Obx(() {
                  if (viewAddEditComputersController.isView) {
                    return ElevatedButton(
                      onPressed: () {
                        viewAddEditComputersController.enterEditMode();
                      },
                      child: const Text('Edit'),
                    );
                  } else if (viewAddEditComputersController.isEdit) {
                    return ElevatedButton(
                      onPressed: () {
                        viewAddEditComputersController.updateComputer();
                      },
                      child: const Text('Save'),
                    );
                  } else if (viewAddEditComputersController.isAdd) {
                    return ElevatedButton(
                      onPressed: () {
                        viewAddEditComputersController.addComputer();
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
      ),
    );
  }
}
