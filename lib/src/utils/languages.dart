/// Ensure language is in correct format for mapbox api.
/// For example, will convert en_US to just en, but keep zh_TW as is.
/// https://docs.mapbox.com/api/search/geocoding/#local-coverage
String safeLanguageCode(String lang) {
  var longAllowed = <String>['zh_TW', 'zh_Hans'];
  if (lang.length > 2) {
    if (longAllowed.contains(lang)) {
      return lang;
    } else {
      return lang.substring(0, 2).toLowerCase();
    }
  } else {
    return lang.toLowerCase();
  }
}
