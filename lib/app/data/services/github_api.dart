import 'dart:convert';
import 'dart:async';
import 'package:flutter_github_profile/app/data/models/repos.dart';
import 'package:flutter_github_profile/app/data/models/user_profile.dart';
import 'package:http/http.dart' as http;

class GithubApi {
  Future<UserProfile> getProfile({String username}) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.github.com/users/$username'));
      // print('API DATA RESPONCE ${response.body}');
      if (response.statusCode == 200) {
        return UserProfile.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('ERROR ${response.body}');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<Repos>> getRepos({String username}) async {
    try {
      final response = await http
          .get(Uri.parse('https://api.github.com/users/$username/repos'));

      List<dynamic> values = List<dynamic>();
      values = json.decode(response.body);
      // var data = response.body;
      // print("RESPONE ===> REPOSE ${response.body}");
      // return data.map((item) => Repos.fromMap(item)).toList();
      return values.map((item) => Repos.fromMap(item)).toList();
    } catch (e) {
      print('eeeeeeeeeeee $e');
      throw e;
    }
  }
}
