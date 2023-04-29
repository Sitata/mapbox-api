import 'package:mapbox_api/src/models/context_object.dart';

class Region extends ContextObject {
  String? regionCode;
  String? regionCodeFull;

  Region.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    regionCode = json['region_code'];
    regionCodeFull = json['region_code_full'];
  }
}
