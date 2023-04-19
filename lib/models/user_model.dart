class UserModel {
  String? sId;
  String? title;
  String? name;
  String? email;
  String? password;
  int? number;
  bool? verified;
  String? status;
  String? dob;
  String? createdAt;
  String? token;

  UserModel(
      {this.sId,
      this.title,
      this.name,
      this.email,
      this.password,
      this.number,
      this.verified,
      this.status,
      this.dob,
      this.createdAt,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    number = json['number'];
    verified = json['verified'];
    status = json['status'];
    dob = json['dob'];
    createdAt = json['createdAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['number'] = number;
    data['verified'] = verified;
    data['status'] = status;
    data['dob'] = dob;
    data['createdAt'] = createdAt;
    data['token'] = token;
    return data;
  }
}
