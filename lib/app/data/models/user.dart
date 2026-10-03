class User {
  int id;
  String nik;
  String location;
  String username;
  String email;
  // String password;
  bool isActive;

  User({
    required this.id,
    required this.nik,
    required this.location,
    required this.username,
    required this.email,
    // required this.password,
    required this.isActive,
  });
}
