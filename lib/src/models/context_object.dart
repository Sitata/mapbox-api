abstract class ContextObject {
  String? id;
  String? name;

  ContextObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
