import 'dart:convert';

import 'package:http/http.dart';
import 'package:mapbox_api/src/search/retrieve_api_response.dart';
import 'package:mapbox_api/src/search/suggestion_api_response.dart';
import 'package:mapbox_api/src/utils/languages.dart';

import '../../mapbox_api.dart';

/// The reverse geocoding query type allows you to look up a
/// single pair of coordinates and returns the geographic feature
/// or features that exist at that location.
///
/// https://docs.mapbox.com/api/search/#reverse-geocoding
class SearchBoxApi {
  String version;
  String endpoint;
  MapboxApi api;
  late SearchBoxSuggest suggest;
  late SearchBoxRetrieve retrieve;

  SearchBoxApi(
    this.api, {
    this.version = 'v1',
    this.endpoint = 'https://api.mapbox.com/search/searchbox',
  }) {
    suggest = SearchBoxSuggest(api, version: version, endpoint: endpoint);
    retrieve = SearchBoxRetrieve(api, version: version, endpoint: endpoint);
  }
}

class SearchBoxSuggest {
  String version;
  String endpoint;
  MapboxApi api;

  SearchBoxSuggest(
    this.api, {
    required this.version,
    required this.endpoint,
  });

  Future<SuggestionApiResponse> request({
    required String query,
    String? language,
    int? limit,
    String? proximity,
    String? origin,
    String? bbox,
    String? navigationProfile,
    String? route,
    String? routeGeometry,
    String? sarType,
    int? timeDeviation,
    String? etaType,
    String? country,
    List<GeocoderPlaceType>? types,
    List<String>? poiCategories,
    double? radius,
    String? userId,
    String? richMetadataProvider,
    String? poiCategoryExclusions,
  }) async {
    var url = endpoint + '/' + version + '/suggest';

    url += '?access_token=${api.accessToken}&session_token=${api.sessionToken}';

    var params = {
      'q': query,
      'language': language != null ? safeLanguageCode(language) : null,
      'limit': limit,
      'proximity': proximity,
      'origin': origin,
      'bbox': bbox,
      'navigation_profile': navigationProfile,
      'route': route,
      'route_geometry': routeGeometry,
      'sar_type': sarType,
      'time_deviation': timeDeviation,
      'eta_type': etaType,
      'country': country,
      'types': _buildTypesStr(types),
      'poi_categories': poiCategories != null ? poiCategories.join(',') : null,
      'radius': radius,
      'user_id': userId,
      'rich_metadata_provider': richMetadataProvider,
      'poi_category_exclusions': poiCategoryExclusions,
    };
    var keepParams = [];
    params.forEach((key, value) {
      if (value != null) {
        keepParams.add('$key=$value');
      }
    });
    url += '&' + keepParams.join('&');

    try {
      final response = await get(Uri.parse(url));
      final json = jsonDecode(
        response.body,
      ) as Map<String, dynamic>;
      return SuggestionApiResponse.fromJson(json);
    } on Error catch (error) {
      return SuggestionApiResponse.withError(error);
    }
  }

  String? _buildTypesStr(List<GeocoderPlaceType>? types) {
    if (types == null) {
      return null;
    }

    var typesStr = [];
    for (var t in types) {
      switch (t) {
        case GeocoderPlaceType.COUNTRY:
          typesStr.add('country');
          break;
        case GeocoderPlaceType.REGION:
          typesStr.add('region');
          break;
        case GeocoderPlaceType.POSTCODE:
          typesStr.add('postcode');
          break;
        case GeocoderPlaceType.DISTRICT:
          typesStr.add('district');
          break;
        case GeocoderPlaceType.PLACE:
          typesStr.add('place');
          break;
        case GeocoderPlaceType.LOCALITY:
          typesStr.add('locality');
          break;
        case GeocoderPlaceType.NEIGHBORHOOD:
          typesStr.add('neighborhood');
          break;
        case GeocoderPlaceType.ADDRESS:
          typesStr.add('address');
          break;
        case GeocoderPlaceType.POI:
          typesStr.add('poi');
          break;
        case GeocoderPlaceType.CITY:
          typesStr.add('city');
          break;
        default:
          break;
      }
    }
    return typesStr.join(',');
  }
}

class SearchBoxRetrieve {
  String version;
  String endpoint;
  MapboxApi api;

  SearchBoxRetrieve(
    this.api, {
    required this.version,
    required this.endpoint,
  });

  Future<RetrieveApiResponse> request({required String id}) async {
    var url = '$endpoint/$version/retrieve/$id';

    url += '?access_token=${api.accessToken}&session_token=${api.sessionToken}';
    try {
      final response = await get(Uri.parse(url));
      final json = jsonDecode(
        response.body,
      ) as Map<String, dynamic>;
      return RetrieveApiResponse.fromJson(json);
    } on Error catch (error) {
      return RetrieveApiResponse.withError(error);
    }
  }
}
