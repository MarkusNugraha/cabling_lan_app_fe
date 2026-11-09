import '../models/device_category.dart';
import '../models/section.dart';
import '../models/location.dart';
import '../models/position.dart';

class DeviceSummary {
  int id;
  String pcName;
  String serialNumber;
  DeviceCategory deviceCategory;
  Position position;
  Location location;
  Section section;

  DeviceSummary({
    required this.id,
    required this.pcName,
    required this.serialNumber,
    required this.deviceCategory,
    required this.position,
    required this.location,
    required this.section,
  });
}
