class UserModel {
  int id=0;
  String name='';
  String email ='';
  String  mobilePhone='';
  String  fixedPhone ='';
  String  address ='';
  String  identificationId ='';


  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']??'';
    email = json['email']??'';
    mobilePhone = json['mobile_phone']??'';
    fixedPhone = json['fixed_phone']??'';
    address = json['address']??'';
    identificationId = json['identification_id']??'';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_phone'] = this.mobilePhone;
    data['fixed_phone'] = this.fixedPhone;
    data['address'] = this.address;
    data['identification_id'] = this.identificationId;

    return data;
  }
}







