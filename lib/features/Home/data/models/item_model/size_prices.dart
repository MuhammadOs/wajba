class SizesPrices {
  SizesPrices({
    this.priceSmall,
    this.priceMedium,
    this.priceLarge,});

  SizesPrices.fromJson(dynamic json) {
    priceSmall = json['priceSmall'];
    priceMedium = json['priceMedium'];
    priceLarge = json['priceLarge'];
  }
  double? priceSmall;
  double? priceMedium;
  double? priceLarge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['priceSmall'] = priceSmall;
    map['priceMedium'] = priceMedium;
    map['priceLarge'] = priceLarge;
    return map;
  }

}