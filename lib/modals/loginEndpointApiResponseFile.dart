class LoginEndpointApiResponseModel {


  int id = 0;
  String name = '';
  String email = '';
  String token = '';

  LoginEndpointApiResponseModel();

  factory LoginEndpointApiResponseModel.fromJson(Map<String, dynamic> json) {
    LoginEndpointApiResponseModel loginEndpointApiResponseModel =
        LoginEndpointApiResponseModel();
    loginEndpointApiResponseModel.id = json["user"]["id"];
    loginEndpointApiResponseModel.name = json["user"]["name"];
    loginEndpointApiResponseModel.email = json["user"]["email"];
    loginEndpointApiResponseModel.token = json["token"];

    return loginEndpointApiResponseModel;
  }
}
