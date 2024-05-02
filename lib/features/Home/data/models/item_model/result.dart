/*import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final int? menuItemId;
  final String? name;
  final String? estimatedTime;
  final String? orderingTime;
  final String? category;
  final String? occassions;
  final Map<String, dynamic>? sizesPrices;
  final bool? healthyMode;
  final String? description;
  final String? photo;
  final String? chefId;

  const Result({
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

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      menuItemId: json['menuItemId'] as int?,
      name: json['name'] as String?,
      estimatedTime: json['estimatedTime'] as String?,
      orderingTime: json['orderingTime'] as String?,
      category: json['category'] as String?,
      occassions: json['occassions'] as String?,
      sizesPrices: (json['sizesPrices'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as int)),
      healthyMode: json['healthyMode'] as bool?,
      description: json['description'] as String?,
      photo: json['photo'] as String?,
      chefId: json['chefId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItemId': menuItemId,
      'name': name,
      'estimatedTime': estimatedTime,
      'orderingTime': orderingTime,
      'category': category,
      'occassions': occassions,
      'sizesPrices': sizesPrices,
      'healthyMode': healthyMode,
      'description': description,
      'photo': photo,
      'chefId': chefId,
    };
  }

  @override
  List<Object?> get props => [
        menuItemId,
        name,
        estimatedTime,
        orderingTime,
        category,
        occassions,
        sizesPrices,
        healthyMode,
        description,
        photo,
        chefId,
      ];
}

 */
