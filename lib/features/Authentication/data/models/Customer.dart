class Customer {
  Customer({
    this.customerId,
    this.phoneNumber,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
    this.birthDate,
    this.wallet,
    this.favourites,
    this.usedCoupones,
    this.orders,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    birthDate = DateTime.parse(json['birthDate']);
    wallet = json['wallet'];
    favourites = json['favourites'];
    usedCoupones = json['usedCoupones'];
    orders = json['orders'];
  }

  int? customerId;
  int? phoneNumber;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;
  DateTime? birthDate;
  double? wallet;
  String? favourites;
  dynamic usedCoupones;
  dynamic orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = customerId;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['role'] = role;
    map['birthDate'] = birthDate?.toIso8601String();
    map['wallet'] = wallet;
    map['favourites'] = favourites;
    map['usedCoupones'] = usedCoupones;
    map['orders'] = orders;
    return map;
  }
}