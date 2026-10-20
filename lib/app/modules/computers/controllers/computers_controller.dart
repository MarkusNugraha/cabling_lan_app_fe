import 'package:cabling_lan_app/app/data/models/device_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/computer.dart';
import '../../../data/models/device_summary.dart';
import '../../../data/providers/computer_provider.dart';
import '../../../../app/modules/sections/controllers/sections_controller.dart';
import '../../../../app/modules/locations/controllers/locations_controller.dart';
import '../../../../app/modules/positions/controllers/positions_controller.dart';

class ComputersController extends GetxController {
  final sectionsController = Get.find<SectionsController>();
  final locationsController = Get.find<LocationsController>();
  final positionsController = Get.find<PositionsController>();

  var computers = List<Computer>.empty().obs;

  final isSearching = false.obs;
  final searchController = TextEditingController();

  final isFilterOpen = false.obs;
  final selectedSectionId = RxnInt();
  final selectedLocationId = RxnInt();
  final selectedPositionId = RxnInt();
  final isActive = true.obs;

  @override
  void onInit() {
    super.onInit();

    getAllComputers(isActive: true);
    searchController.addListener(() {
      isSearching.value = searchController.text.isNotEmpty;
    });

    sectionsController.getAllSections();
  }

  void clearSearch() {
    searchController.clear();
  }

  void toggleFilter() {
    isFilterOpen.value = !isFilterOpen.value;
  }

  void clearFilter() {
    selectedSectionId.value = null;
    selectedLocationId.value = null;
    selectedPositionId.value = null;
    isActive.value = true;

    clearSearch();
  }

  void getAllComputers({String? search, bool? isActive}) {
    ComputerProvider().getAllComputers(search: search, isActive: isActive).then(
      (value) {
        computers.value = List.generate(value.body['data'].length, (index) {
          final item = value.body['data'][index];

          return Computer(
            id: item['id'],
            deviceId: item['device_id'],
            hostname: item['hostname'],
            cpu: item['cpu'],
            ramGb: item['ram_gb'],
            storageGb: item['storage_gb'],
            storageType: item['storage_type'],
            operatingSystem: item['operating_system'],
            ipAddress: item['ip_address'],
            macAddress: item['mac_address'],
            manufacturer: item['manufacturer'],
            model: item['model'],
            note: item['note'],
            isActive: item['is_active'],
            deviceSummary: item['device'] == null
                ? null
                : DeviceSummary(
                    id: item['device']['id'],
                    pcName: item['device']['pc_name'],
                    serialNumber: item['device']['serial_number'],
                    deviceCategoryId: item['device']['device_category_id'],
                    deviceCategory: DeviceCategory(
                      id: item['device']['device_category']['id'],
                      name: item['device']['device_category']['name'],
                    ),
                  ),
          );
        });
      },
    );
  }
}
