import 'dart:convert';

import 'package:mapbox_api/src/models/context.dart';

class Suggestion {
  String? name;
  String? namePreferred;
  String? mapboxId;
  String? featureType;
  String? address;
  String? fullAddress;
  String? placeFormatted;
  Context? context;
  String? language;
  String? maki;
  List<String>? poiCategory;
  List<String>? poiCategoryIds;
  String? brand;
  String? brandId;
  List<String>? externalIds;
  Map<String, dynamic>? metadata;
  double? distance;
  double? eta;
  double? addedDistance;
  double? addedTime;

  Suggestion();

  Suggestion.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    namePreferred = json['name_preferred'];
    mapboxId = json['mapbox_id'];
    featureType = json['feature_type'];
    address = json['address'];
    fullAddress = json['full_address'];
    placeFormatted = json['place_formatted'];
    context =
        json['context'] != null ? Context.fromJson(json['context']) : null;
    language = json['language'];
    maki = json['maki'];

    poiCategory = json['poi_category'];

    poiCategoryIds = json['poi_category_ids'];

    brand = json['brand'];
    brandId = json['brandId'];
    externalIds = (json['upgrade_product_ids'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
    metadata = json['metadata'] as Map<String, dynamic>?;
    eta = json['eta'];
    addedDistance = json['added_distance'];
    addedTime = json['added_time'];
  }
}
