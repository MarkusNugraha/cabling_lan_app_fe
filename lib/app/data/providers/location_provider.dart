import 'package:get/get_connect/connect.dart';
import '../../../app/config/api_config.dart';

class LocationProvider extends GetConnect {
  Future<Response> getAllLocations({
    String? search,
    int? sectionId,
    bool? isActive,
  }) {
    final params = <String, String>{};

    if (search != null) {
      params['search'] = search;
    }

    if (sectionId != null) {
      params['section_id'] = sectionId.toString();
    }

    if (isActive != null) {
      params['is_active'] = isActive ? '1' : '0';
    }

    return get(
      '${ApiConfig.baseUrl}/location',
      query: params,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}
