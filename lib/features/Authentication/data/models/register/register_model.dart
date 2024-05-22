class RegisterModel {
  RegisterModel({
    this.phoneNumber,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
    this.birthDate,
    this.favourites,
    this.usedCoupones,
  });

  RegisterModel.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    birthDate = json['birthDate'];
    favourites = json['favourites'];
    usedCoupones = json['usedCoupones'];
  }

  int? phoneNumber;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;
  String? birthDate;
  String? favourites;
  String? usedCoupones;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['role'] = role;
    map['birthDate'] = birthDate;
    map['favourites'] = favourites;
    map['usedCoupones'] = usedCoupones;
    return map;
  }
}
