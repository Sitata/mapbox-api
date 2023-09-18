import 'package:mapbox_api/src/models/context.dart';
import 'package:mapbox_api/src/models/coordinates.dart';

class Properties {
  String? name;
  String? namePreferred;
  String? mapboxId;
  String? featureType;
  String? address;
  String? fullAddress;
  String? placeFormatted;
  Context? context;
  Coordinates? coordinates;
  List<double>? bbox;
  String? language;
  String? maki;
  List<String>? poiCategory;
  List<String>? poiCategoryIds;
  List<String>? brand;
  List<String>? brandId;
  Map<String, String>? externalIds;
  Map<String, dynamic>? metadata;

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    namePreferred = json['name_preferred'];
    mapboxId = json['mapbox_id'];
    featureType = json['feature_type'];
    address = json['address'];
    fullAddress = json['full_address'];
    placeFormatted = json['place_formatted'];

    context =
        json['context'] != null ? Context.fromJson(json['context']) : null;
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    bbox = (json['bbox'] as List<dynamic>?)?.map((e) => e as double).toList();
    language = json['language'];
    maki = json['maki'];
    poiCategory = (json['poi_category'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
    poiCategoryIds = (json['poi_category_ids'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
    brand = (json['brand'] as List<dynamic>?)?.map((e) => e as String).toList();
    brandId =
        (json['brandId'] as List<dynamic>?)?.map((e) => e as String).toList();
    externalIds = (json['external_ids'] as Map<String, dynamic>?)
        ?.map((key, value) => MapEntry(key, value.toString()));
    metadata = json['metadata'] as Map<String, dynamic>?;
  }
}
