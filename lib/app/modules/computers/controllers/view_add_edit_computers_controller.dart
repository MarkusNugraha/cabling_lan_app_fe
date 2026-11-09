import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/computer.dart';
import '../../../data/models/device_summary.dart';
import '../../../data/models/device_category.dart';
import '../../../data/models/position.dart';
import '../../../data/models/location.dart';
import '../../../data/models/section.dart';
import '../../../data/enums/form_mode.dart';
import '../../../data/services/snackbar_service.dart';
import '../../../data/providers/computer_provider.dart';
import '../../../../app/modules/computers/controllers/computers_controller.dart';
import '../../../../app/modules/sections/controllers/sections_controller.dart';
import '../../../../app/modules/locations/controllers/locations_controller.dart';
import '../../../../app/modules/positions/controllers/positions_controller.dart';
import '../../../../app/modules/device_categories/controllers/device_categories_controller.dart';

class ViewAddEditComputersController extends GetxController {
  final computersController = Get.find<ComputersController>();
  final sectionsController = Get.find<SectionsController>();
  final locationsController = Get.find<LocationsController>();
  final positionsController = Get.find<PositionsController>();
  final deviceCategoriesController = Get.find<DeviceCategoriesController>();

  // Device
  late TextEditingController idAssetController = TextEditingController();
  late TextEditingController pcNameController = TextEditingController();
  late TextEditingController serialNumberController = TextEditingController();
  final selectedSectionId = RxnInt();
  final selectedLocationId = RxnInt();
  final selectedPositionId = RxnInt();
  final selectedDeviceCategoryId = RxnInt();

  // Computer
  late TextEditingController hostnameController = TextEditingController();
  late TextEditingController cpuController = TextEditingController();
  late TextEditingController ramGbController = TextEditingController();
  late TextEditingController storageGbController = TextEditingController();
  late TextEditingController storageTypeController = TextEditingController();
  late TextEditingController operatingSystemController =
      TextEditingController();
  late TextEditingController ipAddressController = TextEditingController();
  late TextEditingController macAddressController = TextEditingController();
  late TextEditingController manufacturerController = TextEditingController();
  late TextEditingController modelController = TextEditingController();
  late TextEditingController noteController = TextEditingController();
  late RxBool isActive = false.obs;

  final formKey = GlobalKey<FormState>();

  final formMode = FormMode.VIEW.obs;
  bool get isAdd => formMode.value == FormMode.ADD;
  bool get isEdit => formMode.value == FormMode.EDIT;
  bool get isView => formMode.value == FormMode.VIEW;
  bool get isReadOnly => isView;

  Computer? computer;

  @override
  void onInit() {
    // Device
    idAssetController = TextEditingController();
    pcNameController = TextEditingController();
    serialNumberController = TextEditingController();

    // Computer
    hostnameController = TextEditingController();
    cpuController = TextEditingController();
    ramGbController = TextEditingController();
    storageGbController = TextEditingController();
    storageTypeController = TextEditingController();
    operatingSystemController = TextEditingController();
    ipAddressController = TextEditingController();
    macAddressController = TextEditingController();
    manufacturerController = TextEditingController();
    modelController = TextEditingController();
    noteController = TextEditingController();

    formMode.value = Get.arguments['formMode'] ?? FormMode.VIEW;
    if (isEdit || isView) {
      if (Get.arguments['id'] != null) {
        findComputerById(Get.arguments['id'].toString());
      } else {
        SnackbarService.error(' Computer ID is required for Edit/View mode.');
      }
    }

    super.onInit();
  }

  String get pageTitle {
    switch (formMode.value) {
      case FormMode.ADD:
        return 'Add Computer';
      case FormMode.EDIT:
        return 'Edit Computer';
      case FormMode.VIEW:
        return 'View Computer';
    }
  }

  void enterEditMode() {
    if (isView) {
      formMode.value = FormMode.EDIT;
    }
  }

  void findComputerById(String id) {
    ComputerProvider().getComputerById(id).then((value) {
      computer = Computer(
        id: value.body['data']['id'],
        deviceId: value.body['data']['device_id'],
        hostname: value.body['data']['hostname'],
        cpu: value.body['data']['cpu'],
        ramGb: value.body['data']['ram_gb'],
        storageGb: value.body['data']['storage_gb'],
        storageType: value.body['data']['storage_type'],
        operatingSystem: value.body['data']['operating_system'],
        ipAddress: value.body['data']['ip_address'],
        macAddress: value.body['data']['mac_address'],
        manufacturer: value.body['data']['manufacturer'],
        model: value.body['data']['model'],
        note: value.body['data']['note'] ?? '',
        isActive: value.body['data']['is_active'],

        deviceSummary: DeviceSummary(
          id: value.body['data']['device']['id'],
          pcName: value.body['data']['device']['pc_name'],
          serialNumber: value.body['data']['device']['serial_number'],
          deviceCategory: DeviceCategory(
            id: value.body['data']['device']['device_category']['id'],
            name: value.body['data']['device']['device_category']['name'],
          ),
          position: Position(
            id: value.body['data']['device']['position']['id'],
            locationId: value.body['data']['device']['position']['location_id'],
            name: value.body['data']['device']['position']['name'],
          ),
          location: Location(
            id: value.body['data']['device']['position']['location']['id'],
            sectionId: value
                .body['data']['device']['position']['location']['section_id'],
            name: value.body['data']['device']['position']['location']['name'],
          ),
          section: Section(
            id: value
                .body['data']['device']['position']['location']['section']['id'],
            name: value
                .body['data']['device']['position']['location']['section']['name'],
          ),
        ),
      );

      sectionsController.getAllSections();
      locationsController.getAllLocations(
        sectionId: computer!.deviceSummary!.section.id,
      );
      positionsController.getAllPositions(
        locationId: computer!.deviceSummary!.location.id,
      );

      // Device
      idAssetController.text = computer!.deviceSummary!.id.toString();
      pcNameController.text = computer!.deviceSummary!.pcName;
      serialNumberController.text = computer!.deviceSummary!.serialNumber;
      selectedSectionId.value = computer!.deviceSummary!.section.id;
      selectedLocationId.value = computer!.deviceSummary!.location.id;
      selectedPositionId.value = computer!.deviceSummary!.position.id;
      selectedDeviceCategoryId.value =
          computer!.deviceSummary!.deviceCategory.id;

      // Computer
      hostnameController.text = computer!.hostname;
      cpuController.text = computer!.cpu;
      ramGbController.text = computer!.ramGb.toString();
      storageGbController.text = computer!.storageGb.toString();
      storageTypeController.text = computer!.storageType;
      operatingSystemController.text = computer!.operatingSystem;
      ipAddressController.text = computer!.ipAddress;
      macAddressController.text = computer!.macAddress;
      manufacturerController.text = computer!.manufacturer;
      modelController.text = computer!.model;
      noteController.text = computer!.note;
      isActive.value = computer!.isActive;
    });
  }

  Future<void> updateComputer() async {
    if (!formKey.currentState!.validate()) {
      SnackbarService.error("Fill all required fields.");
      return;
    }

    final response = await ComputerProvider().updateComputer(
      id: Get.arguments['id'].toString(),
      // Device
      pcName: pcNameController.text,
      serialNumber: serialNumberController.text,
      deviceCategoryId: selectedDeviceCategoryId.value!,
      positionId: selectedPositionId.value!,

      // Computer
      hostname: hostnameController.text,
      cpu: cpuController.text,
      ramGb: ramGbController.text,
      storageGb: storageGbController.text,
      storageType: storageTypeController.text,
      operatingSystem: operatingSystemController.text,
      ipAddress: ipAddressController.text,
      macAddress: macAddressController.text,
      manufacturer: manufacturerController.text,
      model: modelController.text,
      note: noteController.text,
      isActive: isActive.value,
    );

    if (response.isOk) {
      computersController.getAllComputers(isActive: true);
      Get.back();
      SnackbarService.success("${response.body['message']}");
    } else {
      final message = response.body is Map
          ? response.body['message'] ?? 'Failed to update computer'
          : 'Failed to update computer';

      SnackbarService.error(message);
    }
  }

  Future<void> addComputer() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final response = await ComputerProvider().addComputer(
      // Device
      idAsset: int.parse(idAssetController.text),
      pcName: pcNameController.text,
      serialNumber: serialNumberController.text,
      deviceCategoryId: selectedDeviceCategoryId.value!,
      positionId: selectedPositionId.value!,

      // Computer
      hostname: hostnameController.text,
      cpu: cpuController.text,
      ramGb: ramGbController.text,
      storageGb: storageGbController.text,
      storageType: storageTypeController.text,
      operatingSystem: operatingSystemController.text,
      ipAddress: ipAddressController.text,
      macAddress: macAddressController.text,
      manufacturer: manufacturerController.text,
      model: modelController.text,
      note: noteController.text,
    );

    if (response.isOk) {
      computersController.getAllComputers();
      Get.back();
      SnackbarService.success("${response.body['message']}");
    } else {
      final message = response.body is Map
          ? response.body['message'] ?? 'Failed to update computer'
          : 'Failed to update computer';

      SnackbarService.error(message);
    }
  }

  @override
  void onClose() {
    idAssetController.dispose();
    pcNameController.dispose();
    serialNumberController.dispose();

    hostnameController.dispose();
    cpuController.dispose();
    ramGbController.dispose();
    storageGbController.dispose();
    storageTypeController.dispose();
    operatingSystemController.dispose();
    ipAddressController.dispose();
    macAddressController.dispose();
    manufacturerController.dispose();
    modelController.dispose();
    noteController.dispose();
    super.onClose();
  }
}
