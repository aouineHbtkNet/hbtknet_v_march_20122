class LoginResponseDataModel {
  String message='';
  int id = 0;
  String name = '';
  String email = '';
  String token = '';

  LoginResponseDataModel();

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) {
    LoginResponseDataModel loginResponseDataModel =
    LoginResponseDataModel();
    loginResponseDataModel.message = json["message"];
    loginResponseDataModel.id = json["user"]["id"];
    loginResponseDataModel.name = json["user"]["name"];
    loginResponseDataModel.email = json["user"]["email"];
    loginResponseDataModel.token = json["token"];

    return loginResponseDataModel;
  }
}


