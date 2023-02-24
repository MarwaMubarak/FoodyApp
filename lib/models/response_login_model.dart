class ResponseLoginModel {
  ResponseLoginModel({
    required this.status,
    required this.message,
  });
  late final bool status;
  late final String message;

  ResponseLoginModel.fromJson(Map<dynamic, dynamic> json){
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
