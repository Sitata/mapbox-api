class Geometry {
  /// The coordinates of the feature, formatted as [longitude,latitude].
  List<double>? coordinates;
  String? type;

  Geometry.fromJson(Map<String, dynamic> json) {
    coordinates = (json['coordinates'] as List<dynamic>?)
        ?.map((e) => e as double)
        .toList();

    type = json['type'];
  }
}
