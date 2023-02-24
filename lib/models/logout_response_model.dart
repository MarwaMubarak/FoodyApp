
class LogoutResponseModel {
  LogoutResponseModel({
    required this.status,
    required this.message,
    required this.date,
  });
  late final bool status;
  late final String message;
  late final  date;

  LogoutResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['date'] = date;
    return _data;
  }
}