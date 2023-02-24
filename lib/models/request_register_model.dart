class RequestRegisterModel {
  RequestRegisterModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
  late final String name;
  late final String phone;
  late final String email;
  late final String password;

  RequestRegisterModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}