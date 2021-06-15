import 'package:flutter/foundation.dart';

class Repos {
  // ignore: non_constant_identifier_names
  String name, html_url;

  Repos({
    @required this.name,
    // ignore: non_constant_identifier_names
    @required this.html_url,
  });

  static Repos fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Repos(
      name: map['name'],
      html_url: map['html_url'],
    );
  }

  Repos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    html_url = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['html_url'] = this.html_url;
    return data;
  }
}
