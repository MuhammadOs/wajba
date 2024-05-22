import 'package:wajba/features/Home/data/models/item_model/meal.dart';

import 'address_model.dart';

class Kitchen {
  Kitchen({
    this.chefId,
    this.phoneNumber,
    this.email,
    this.chefFirstName,
    this.chefLastName,
    this.restaurantName,
    this.birthDate,
    this.description,
    this.rating,
    this.wallet,
    this.profilePicture,
    this.address,
    this.active,
    this.menuItems,
    this.promoCodes,
  });

  Kitchen.fromJson(dynamic json) {
    chefId = json['chefId'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    chefFirstName = json['chefFirstName'];
    chefLastName = json['chefLastName'];
    restaurantName = json['restaurantName'];
    birthDate = json['birthDate'];
    description = json['description'];
    rating = json['rating'];
    wallet = json['wallet'];
    profilePicture = json['profilePicture'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    active = json['active'];
    if (json['menuItems'] != null) {
      menuItems = [];
      json['menuItems'].forEach((v) {
        menuItems?.add(Meal.fromJson(v));
      });
    }
    promoCodes = json['promoCodes'];
  }

  String? chefId;
  int? phoneNumber;
  String? email;
  String? chefFirstName;
  String? chefLastName;
  String? restaurantName;
  String? birthDate;
  String? description;
  dynamic rating;
  double? wallet;
  String? profilePicture;
  Address? address;
  bool? active;
  List<dynamic>? menuItems;
  List<dynamic>? promoCodes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chefId'] = chefId;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['chefFirstName'] = chefFirstName;
    map['chefLastName'] = chefLastName;
    map['restaurantName'] = restaurantName;
    map['birthDate'] = birthDate;
    map['description'] = description;
    map['rating'] = rating;
    map['wallet'] = wallet;
    map['profilePicture'] = profilePicture;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['active'] = active;
    if (menuItems != null) {
      map['menuItems'] = menuItems?.map((v) => v.toJson()).toList();
    }
    map['promoCodes'] = promoCodes;
    return map;
  }
}
