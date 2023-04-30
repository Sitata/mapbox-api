import 'package:mapbox_api/src/models/routable_point.dart';

class Coordinates {
  double? longitude;
  double? latitude;
  String? accuracy;
  List<RoutablePoint>? routablePoints;

  Coordinates.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    accuracy = json['accuracy'];

    routablePoints = (json['routable_points'] as List<dynamic>?)
        ?.map((e) => RoutablePoint.fromJson(e))
        .toList();
  }
}
