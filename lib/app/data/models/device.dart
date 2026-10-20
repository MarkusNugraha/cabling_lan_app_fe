class Device {
  int id;
  String pcName;
  String serialNumber;
  int deviceCategoryId;
  int positionId;
  String note;
  bool isActive;

  Device({
    required this.id,
    required this.pcName,
    required this.serialNumber,
    required this.deviceCategoryId,
    required this.positionId,
    required this.note,
    required this.isActive,
  });
}
