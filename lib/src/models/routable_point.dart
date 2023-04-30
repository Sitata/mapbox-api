class RoutablePoint {
  double? longitude;
  double? latitude;
  String? name;

  RoutablePoint.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
}
