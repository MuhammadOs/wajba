import 'package:wajba/features/Home/data/models/size_prices.dart';

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
    this.chefId,
  });

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
  String? chefId;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      menuItemId: json['menuItemId'],
      name: json['name'],
      estimatedTime: json['estimatedTime'],
      orderingTime: json['orderingTime'],
      category: json['category'],
      occassions: json['occassions'],
      sizesPrices: SizesPrices.fromJson(json['sizesPrices']),
      healthyMode: json['healthyMode'],
      description: json['description'],
      photo: json['photo'],
      chefId: json['chefId'],
    );
  }
}
