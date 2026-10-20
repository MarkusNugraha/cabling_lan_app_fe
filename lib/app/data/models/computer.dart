import '../models/device_summary.dart';

class Computer {
  int id;
  int deviceId;
  String hostname;
  String cpu;
  int ramGb;
  int storageGb;
  String storageType;
  String operatingSystem;
  String ipAddress;
  String macAddress;
  String manufacturer;
  String model;
  String note;
  bool isActive;
  DeviceSummary? deviceSummary;

  Computer({
    required this.id,
    required this.deviceId,
    required this.hostname,
    required this.cpu,
    required this.ramGb,
    required this.storageGb,
    required this.storageType,
    required this.operatingSystem,
    required this.ipAddress,
    required this.macAddress,
    required this.manufacturer,
    required this.model,
    required this.note,
    required this.isActive,
    this.deviceSummary,
  });
}
