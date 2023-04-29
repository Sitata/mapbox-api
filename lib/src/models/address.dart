import 'package:mapbox_api/src/models/context_object.dart';

class Address extends ContextObject {
  String? addressNumber;
  String? streetName;

  Address.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    addressNumber = json['address_number'];
    streetName = json['street_name'];
  }
}
