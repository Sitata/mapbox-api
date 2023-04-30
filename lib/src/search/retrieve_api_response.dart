import 'package:mapbox_api/mapbox_api.dart';
import 'package:mapbox_api/src/models/feature.dart';

class RetrieveApiResponse {
  String? attribution;
  String? type;
  List<Feature>? features;
  Error? error;

  RetrieveApiResponse({
    this.attribution,
    this.features,
    this.error,
  });

  RetrieveApiResponse.withError(Error error) {
    error = error;
  }

  RetrieveApiResponse.fromJson(Map<String, dynamic> json) {
    final _message = json['message'] as String?;

    if (_message != null) {
      error = MapBoxApiError(message: _message);
    } else {
      attribution = json['attribution'] as String?;
      features =
          json.containsKey('features') ? _parseFeatures(json['features']) : [];
    }
  }

  List<Feature> _parseFeatures(List<dynamic> features) {
    var keepers = <Feature>[];
    for (var feature in features) {
      keepers.add(Feature.fromJson(feature));
    }
    return keepers;
  }

  @override
  String toString() {
    return 'RetrieveApiResponse{'
        'attribution: $attribution, '
        'features: ${features?.length}, '
        'error: $error, '
        '}';
  }
}
