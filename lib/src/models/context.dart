import 'package:mapbox_api/src/models/address.dart';
import 'package:mapbox_api/src/models/country.dart';
import 'package:mapbox_api/src/models/district.dart';
import 'package:mapbox_api/src/models/locality.dart';
import 'package:mapbox_api/src/models/neighborhood.dart';
import 'package:mapbox_api/src/models/place.dart';
import 'package:mapbox_api/src/models/postcode.dart';
import 'package:mapbox_api/src/models/region.dart';
import 'package:mapbox_api/src/models/street.dart';

class Context {
  Country? country;
  Region? region;
  Postcode? postcode;
  District? district;
  Place? place;
  Locality? locality;
  Neighborhood? neighborhood;
  Address? address;
  Street? street;

  Context.fromJson(Map<String, dynamic> json) {
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    postcode =
        json['postcode'] != null ? Postcode.fromJson(json['postcode']) : null;
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
    locality =
        json['locality'] != null ? Locality.fromJson(json['locality']) : null;
    neighborhood = json['neighborhood'] != null
        ? Neighborhood.fromJson(json['neighborhood'])
        : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    street = json['street'] != null ? Street.fromJson(json['street']) : null;
  }
}
