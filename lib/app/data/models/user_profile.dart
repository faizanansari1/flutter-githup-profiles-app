import 'package:flutter/foundation.dart';

class UserProfile {
  // ignore: non_constant_identifier_names
  String name, avatar_url, bio;
  int followers, following;
  UserProfile({
    @required this.name,
    // ignore: non_constant_identifier_names
    @required this.avatar_url,
    @required this.bio,
    @required this.followers,
    @required this.following,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    name = json['login'];
    avatar_url = json['avatar_url'];
    bio = json['bio'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['avatar_url'] = this.avatar_url;
    data['followers'] = this.followers;
    data['following'] = this.following;
    return data;
  }
}
