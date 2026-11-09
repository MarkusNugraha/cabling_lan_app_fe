import 'package:get/get_connect/connect.dart';
import '../../../app/config/api_config.dart';

class ComputerProvider extends GetConnect {
  Future<Response> getAllComputers({String? search, bool? isActive}) {
    final params = <String, String>{};

    if (search != null) {
      params['search'] = search;
    }

    if (isActive != null) {
      params['is_active'] = isActive ? '1' : '0';
    }

    // print(params);
    return get(
      '${ApiConfig.baseUrl}/computer',
      query: params,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> getComputerById(String id) {
    return get('${ApiConfig.baseUrl}/computer/$id');
  }

  Future<Response> addComputer({
    // Device
    required int idAsset,
    required String pcName,
    required String serialNumber,
    required int deviceCategoryId,
    required int positionId,

    // Computer
    required String hostname,
    required String cpu,
    required String ramGb,
    required String storageGb,
    required String storageType,
    required String operatingSystem,
    required String ipAddress,
    required String macAddress,
    required String manufacturer,
    required String model,
    required String note,
  }) {
    return post(
      '${ApiConfig.baseUrl}/computer',
      {
        'id_asset': idAsset,
        'pc_name': pcName,
        'serial_number': serialNumber,
        'device_category_id': deviceCategoryId,
        'position_id': positionId,
        'hostname': hostname,
        'cpu': cpu,
        'ram_gb': ramGb,
        'storage_gb': storageGb,
        'storage_type': storageType,
        'operating_system': operatingSystem,
        'ip_address': ipAddress,
        'mac_address': macAddress,
        'manufacturer': manufacturer,
        'model': model,
        'note': note,
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> updateComputer({
    required String id,

    // Device
    required String pcName,
    required String serialNumber,
    required int deviceCategoryId,
    required int positionId,

    // Computer
    required String hostname,
    required String cpu,
    required String ramGb,
    required String storageGb,
    required String storageType,
    required String operatingSystem,
    required String ipAddress,
    required String macAddress,
    required String manufacturer,
    required String model,
    required String note,
    required bool isActive,
  }) {
    return put(
      '${ApiConfig.baseUrl}/computer/$id',
      {
        'pc_name': pcName,
        'serial_number': serialNumber,
        'device_category_id': deviceCategoryId,
        'position_id': positionId,
        'hostname': hostname,
        'cpu': cpu,
        'ram_gb': ramGb,
        'storage_gb': storageGb,
        'storage_type': storageType,
        'operating_system': operatingSystem,
        'ip_address': ipAddress,
        'mac_address': macAddress,
        'manufacturer': manufacturer,
        'model': model,
        'note': note,
        'is_active': isActive,
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}
