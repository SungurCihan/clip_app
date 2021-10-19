class UserResponseModel {
  late String token;
  late String expiration;

  UserResponseModel(this.token, this.expiration);

  UserResponseModel.fromJson(Map json) {
    token = json["token"];
    expiration = json["expiration"];
  }

  Map toJson() {
    return {"token": token, "expiration": expiration};
  }
}
