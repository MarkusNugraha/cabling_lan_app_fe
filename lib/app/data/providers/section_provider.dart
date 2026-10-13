import 'package:get/get_connect/connect.dart';
import '../../../app/config/api_config.dart';

class SectionProvider extends GetConnect {
  Future<Response> getAllSections({String? search, bool? isActive}) {
    final params = <String, String>{};

    if (search != null) {
      params['search'] = search;
    }

    if (isActive != null) {
      params['is_active'] = isActive ? '1' : '0';
    }

    return get(
      '${ApiConfig.baseUrl}/section',
      query: params,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}
