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
