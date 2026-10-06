import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  final url = "http://192.168.211.33:8000/api";

  Future<Response> getAllUsers() {
    return get('$url/user');
  }

  Future<Response> getUserById(String id) {
    return get('$url/user/$id');
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
      '$url/user/$id',
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
      '$url/user',
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
