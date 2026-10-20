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
}
