class UserModel{
  late final int? id;
  final String? userid;
  final String username;
  final int usernumber;
  UserModel({this.id, this.userid, required this.username,required this.usernumber});
  // now here we are converting the user  class properties to the map
  Map<String,dynamic?> toMap(){
    return {
      'id':id,
      'userid':userid,
      'username':username,
      'usernumber':usernumber
    };

  }
  UserModel.fromMap(Map<String,dynamic?> res):
  id=res['id'],
  userid=res['userid'],
  username=res['username'],
  usernumber=res['usernumber'];
}
//now here our model is ready to use