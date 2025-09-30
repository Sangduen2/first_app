class Air {
  final int aqi;
  final String city;
  final double iaqi;

  Air(this.aqi, this.city, this.iaqi);

  Air.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'],
        city = json['data']['city']['name'],
        iaqi = (json['data']['iaqi']['t']['v']).toDouble();

  Map<String, dynamic> toJson() {
    return {'aqi': aqi, 'city': city, 'iaqi': iaqi};
  }
}
