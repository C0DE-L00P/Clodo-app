class User {
  String? email;
  String? password;
  String? username;
  String? firstname;
  String? lastname;
  String? phone;
  String? img;

  User(
      {required this.email,
      required this.password,
      this.username,
      this.firstname,
      this.lastname,
      this.phone,
      this.img});

  Map toJson() => {
        'email': email,
        'password': password,
        'username': username,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'img': img,
      };
}
