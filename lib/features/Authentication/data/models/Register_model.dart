class RegisterModel {
  int? phoneNumber;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;
  String? birthdate;
  String? favourites;
  String? usedCoupones;

  RegisterModel({
      this.phoneNumber, 
      this.email, 
      this.password, 
      this.firstName, 
      this.lastName, 
      this.role, 
      this.birthdate, 
      this.favourites, 
      this.usedCoupones,});

  RegisterModel.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    birthdate = json['birthdate'];
    favourites = json['favourites'];
    usedCoupones = json['usedCoupones'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['role'] = role;
    map['birthdate'] = birthdate;
    map['favourites'] = favourites;
    map['usedCoupones'] = usedCoupones;
    return map;
  }

}