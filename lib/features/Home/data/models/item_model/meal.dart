import 'package:wajba/features/Home/data/models/item_model/size_prices.dart';

class Meal {
  Meal({
    this.menuItemId,
    this.name,
    this.estimatedTime,
    this.orderingTime,
    this.category,
    this.occassions,
    this.sizesPrices,
    this.healthyMode,
    this.description,
    this.photo,
    this.restaurantPhoto,
    this.restaurantName,
  });

  Meal.fromJson(dynamic json) {
    menuItemId = json['menuItemId'];
    name = json['name'];
    estimatedTime = json['estimatedTime'];
    orderingTime = json['orderingTime'];
    category = json['category'];
    occassions = json['occassions'];
    sizesPrices = json['sizesPrices'] != null
        ? SizesPrices.fromJson(json['sizesPrices'])
        : null;
    healthyMode = json['healthyMode'];
    description = json['description'];
    photo = json['photo'];
    restaurantPhoto = json['restaurantPhoto'];
    restaurantName = json['restaurantName'];
  }

  int? menuItemId;
  String? name;
  String? estimatedTime;
  String? orderingTime;
  String? category;
  String? occassions;
  SizesPrices? sizesPrices;
  bool? healthyMode;
  String? description;
  String? photo;
  String? restaurantPhoto;
  String? restaurantName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['menuItemId'] = menuItemId;
    map['name'] = name;
    map['estimatedTime'] = estimatedTime;
    map['orderingTime'] = orderingTime;
    map['category'] = category;
    map['occassions'] = occassions;
    if (sizesPrices != null) {
      map['sizesPrices'] = sizesPrices?.toJson();
    }
    map['healthyMode'] = healthyMode;
    map['description'] = description;
    map['photo'] = photo;
    map['restaurantPhoto'] = restaurantPhoto;
    map['restaurantName'] = restaurantName;
    return map;
  }
}
