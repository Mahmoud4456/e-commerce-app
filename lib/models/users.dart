class UsersModel{

  int id ;
  String email ;
  String frist_name ;
  String last_name ;
  String avatar ;
 UsersModel({required this.id ,required this.frist_name, required this.avatar, required this.email , required this.last_name});

 factory UsersModel.fromjson(Map< String,dynamic> json) {
return UsersModel(
    id : json["id"],
    email : json["email"],
    frist_name: json["first_name"],
    last_name: json["last_name"],
    avatar: json["avatar"],
);
 }
}

// https://reqres.in/api/users?page=2

// "id": 7,
// "email": "michael.lawson@reqres.in",
// "first_name": "Michael",
// "last_name": "Lawson",
// "avatar": "https://reqres.in/img/faces/7-image.jpg"
// },