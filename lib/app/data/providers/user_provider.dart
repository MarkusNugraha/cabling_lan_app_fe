import 'package:get/get_connect/connect.dart';
import '../../../app/config/api_config.dart';

class UserProvider extends GetConnect {
  Future<Response> getAllUsers({
    String? search,
    String? position,
    bool? isActive,
  }) {
    final params = <String, String>{};

    if (search != null) {
      params['search'] = search;
    }

    if (position != null) {
      params['position'] = position;
    }

    if (isActive != null) {
      params['is_active'] = isActive ? '1' : '0';
    }

    // print(params);
    return get(
      '${ApiConfig.baseUrl}/user',
      query: params,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> getUserById(String id) {
    return get('${ApiConfig.baseUrl}/user/$id');
  }

  Future<Response> updateUser({
    required String id,
    required String nik,
    required String location,
    required String username,
    required String email,
    required bool isActive,
  }) {
    return put(
      '${ApiConfig.baseUrl}/user/$id',
      {
        'nik': nik,
        'location': location,
        'username': username,
        'email': email,
        'is_active': isActive,
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> addUser({
    required String nik,
    required String location,
    required String username,
    required String email,
    required String password,
  }) {
    return post(
      '${ApiConfig.baseUrl}/user',
      {
        'nik': nik,
        'location': location,
        'username': username,
        'email': email,
        'password': password,
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}
