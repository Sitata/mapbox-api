import 'package:mapbox_api/src/models/suggestion.dart';
import 'package:mapbox_api/src/models/mapbox_api_error.dart';

class SuggestionApiResponse {
  String? attribution;
  List<Suggestion>? suggestions;
  Error? error;

  SuggestionApiResponse({
    this.attribution,
    this.suggestions,
    this.error,
  });

  SuggestionApiResponse.withError(Error error) {
    error = error;
  }

  SuggestionApiResponse.fromJson(Map<String, dynamic> json) {
    final _message = json['message'] as String?;

    if (_message != null) {
      error = MapBoxApiError(message: _message);
    } else {
      attribution = json['attribution'] as String?;
      suggestions = json.containsKey('suggestions')
          ? _parseSuggestions(json['suggestions'])
          : [];
    }
  }

  List<Suggestion> _parseSuggestions(List<dynamic> suggestions) {
    var keepers = <Suggestion>[];
    for (var suggestion in suggestions) {
      keepers.add(Suggestion.fromJson(suggestion));
    }
    return keepers;
  }

  @override
  String toString() {
    return 'SuggestionApiResponse{'
        'attribution: $attribution, '
        'suggestions: ${suggestions?.length}, '
        'error: $error, '
        '}';
  }
}
