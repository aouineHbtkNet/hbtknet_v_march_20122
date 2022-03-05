

class UserProfileModel {
  String  name ='';
   String   email ='';
   int  id  = 0 ;

UserProfileModel();

factory UserProfileModel.fromJson(Map <String, dynamic> json) {
  UserProfileModel user =UserProfileModel();
  user.id = json["id"];
  user.name = json["name"];
   user.email= json["email"];


  return user;

}



}