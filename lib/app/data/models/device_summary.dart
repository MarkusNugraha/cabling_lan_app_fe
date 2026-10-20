import '../models/device_category.dart';

class DeviceSummary {
  int id;
  String pcName;
  String serialNumber;
  int deviceCategoryId;
  DeviceCategory deviceCategory;

  DeviceSummary({
    required this.id,
    required this.pcName,
    required this.serialNumber,
    required this.deviceCategoryId,
    required this.deviceCategory,
  });
}
