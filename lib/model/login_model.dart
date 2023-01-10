
class Login {
  String? email;
  String? password;

  Login({this.email, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
  }

  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}