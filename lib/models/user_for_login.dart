class UserForLogin {
  late String email;
  late String password;

  UserForLogin(this.email, this.password);

  UserForLogin.fromJson(Map json) {
    email = json["email"];
    password = json["password"];
  }

  Map toJson() {
    return {"email": email, "password": password};
  }
}
