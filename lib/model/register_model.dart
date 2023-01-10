class User {
  String? email;
  String? name;
  String? mobile;
  String? pass;
  String? role;
  String? status;

  User({this.email, this.name, this.mobile, this.pass, this.role, this.status});

  factory User.fromJson(Map<String, dynamic> json) => User(
    
  );
}
