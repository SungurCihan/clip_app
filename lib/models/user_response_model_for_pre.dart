class UserResponseModelForPre {
  late bool success;
  late String? message;

  UserResponseModelForPre(this.success, this.message);

  UserResponseModelForPre.fromJson(Map json) {
    success = json["success"];
    message = json["message"];
  }

  Map toJson() {
    return {"success": success, "message": message};
  }
}
