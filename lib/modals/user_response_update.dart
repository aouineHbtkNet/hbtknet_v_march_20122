class UserRespnseUpdate {
  String message='';
  int id = 0;
  String name = '';
  String email = '';
  String mobile_phone='';
  String 	fixed_phone='';
  String address='';
  String identification_id='';


  UserRespnseUpdate();

  factory UserRespnseUpdate.fromJson(Map<String, dynamic> json) {
    UserRespnseUpdate userResponseUpdate =UserRespnseUpdate();
    userResponseUpdate.message = json["message"]??'';
    userResponseUpdate.id = json["user"]?["id"] ?? 0;
    userResponseUpdate.name = json["user"]?["name"] ?? 'No user name found';
    userResponseUpdate.email = json["user"]?["email"] ?? 'No email found ';
    userResponseUpdate.mobile_phone = json["user"]?["mobile_phone"]??' No mobile phone found';
    userResponseUpdate.fixed_phone = json["user"]?["fixed_phone"] ??'No fixed phone found';
    userResponseUpdate.address = json["user"]?["address"]??' No address found';
    userResponseUpdate.identification_id = json["user"]?["identification_id"]??'No identification id found';
    return userResponseUpdate;
  }










}
