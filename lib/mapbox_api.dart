import 'package:mapbox_api/src/search/search_box.dart';

import './src/navigation/directions.dart';
import './src/navigation/isochrome.dart';
import './src/navigation/map_matching.dart';
import './src/navigation/matrix.dart';
import './src/navigation/optimization.dart';

import './src/search/forward_geocoding.dart';
import './src/search/reverse_geocoding.dart';
import './src/search/intersection.dart';

export './src/navigation/globals.dart';
export './src/navigation/directions.dart';
export './src/navigation/isochrome.dart';
export './src/navigation/map_matching.dart';
export './src/navigation/matrix.dart';
export './src/navigation/optimization.dart';

export './src/search/globals.dart';
export './src/search/forward_geocoding.dart';
export './src/search/reverse_geocoding.dart';
export './src/search/intersection.dart';
export './src/models/address.dart';
export './src/models/context.dart';
export './src/models/coordinates.dart';
export './src/models/country.dart';
export './src/models/district.dart';
export './src/models/feature.dart';
export './src/models/geometry.dart';
export './src/models/locality.dart';
export './src/models/neighborhood.dart';
export './src/models/place.dart';
export './src/models/postcode.dart';
export './src/models/properties.dart';
export './src/models/region.dart';
export './src/models/routable_point.dart';
export './src/models/street.dart';
export './src/models/suggestion.dart';
export 'src/models/mapbox_api_error.dart';

const LATITUDE = 0;
const LONGITUDE = 1;

/// The Mapbox web services APIs allow you to programmatically
/// access Mapbox tools and services.
/// You can use these APIs to retrieve information about your account,
/// upload and change resources, use core Mapbox tools, and more.
///
/// https://docs.mapbox.com/api/
class MapboxApi {
  MapboxApi({
    this.accessToken,
    this.sessionToken,
  }) {
    directions = DirectionsApi(this);
    mapMatching = MapMatchingApi(this);
    isochrone = IsochroneApi(this);
    matrix = MatrixApi(this);
    optimization = OptimizationApi(this);
    forwardGeocoding = ForwardGeocodingApi(this);
    reverseGeocoding = ReverseGeocodingApi(this);
    intersection = IntersectionApi(this);
    searchBox = SearchBoxApi(this);
  }

  late DirectionsApi directions;
  MapMatchingApi? mapMatching;
  IsochroneApi? isochrone;
  MatrixApi? matrix;
  OptimizationApi? optimization;

  late ForwardGeocodingApi forwardGeocoding;
  late ReverseGeocodingApi reverseGeocoding;
  late IntersectionApi intersection;
  late SearchBoxApi searchBox;

  String? accessToken;
  String? sessionToken;
}
