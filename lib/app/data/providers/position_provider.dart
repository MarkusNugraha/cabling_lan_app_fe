import 'package:get/get_connect/connect.dart';
import '../../../app/config/api_config.dart';

class PositionProvider extends GetConnect {
  Future<Response> getAllPositions({
    String? search,
    int? locationId,
    bool? isActive,
  }) {
    final params = <String, String>{};

    if (search != null) {
      params['search'] = search;
    }

    if (locationId != null) {
      params['location_id'] = locationId.toString();
    }

    if (isActive != null) {
      params['is_active'] = isActive ? '1' : '0';
    }

    return get(
      '${ApiConfig.baseUrl}/position',
      query: params,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}
