import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  final url = "http://192.168.211.206:8000/api";

  // GET All user
  Future<Response> getAllUsers() {
    return get('$url/user');
  }
}
