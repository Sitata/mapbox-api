import 'package:mapbox_api/src/models/context_object.dart';

class Country extends ContextObject {
  String? countryCode;
  String? countryCodeAlpha3;

  Country.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    countryCode = json['country_code'];
    countryCodeAlpha3 = json['country_code_alpha_3'];
  }
}
