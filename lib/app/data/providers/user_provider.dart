import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  // final url = "http://127.0.0.1:8000/api";
  final url = "http://192.168.211.82:8000/api";
  // final url = "http://localhost:8000/api";

  // GET All user
  Future<Response> getAllUsers() {
    print('RESPONSE: $url/user');
    return get('$url/user');
  }
}
