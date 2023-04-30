import 'package:mapbox_api/src/models/geometry.dart';
import 'package:mapbox_api/src/models/properties.dart';

class Feature {
  String? type;
  Geometry? geometry;
  Properties? properties;

  Feature.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }
}
