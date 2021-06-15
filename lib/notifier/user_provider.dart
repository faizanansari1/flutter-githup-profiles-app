import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_profile/app/data/models/repos.dart';
import 'package:flutter_github_profile/app/data/models/user_profile.dart';
import 'package:flutter_github_profile/app/data/services/github_api.dart';
import 'package:flutter_github_profile/app/routes/app_routes.dart';
import 'package:flutter_github_profile/ui/widgets/show_custom_dialog.dart';

class UserProvider extends ChangeNotifier {
  GithubApi _githubApi = GithubApi();

  bool isLoading = false;

  UserProfile _user;
  UserProfile get user => _user;

  List<Repos> _repos;
  List<Repos> get repos => _repos;

  void setloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getUserProfile({String username, BuildContext ctx}) async {
    setloading(true);
    try {
      final UserProfile response =
          await _githubApi.getProfile(username: username);
      _user = response;
      setloading(false);
      // Navigator.of(ctx).pushNamed(AppRoutes.user_details);
      // print('USR INFOO ${user.name}');
    } catch (e) {
      // print("ERROE $e");
      showCustomDialog(ctx, 'Error', e.toString());
      setloading(false);
    }
  }

  Future<void> getUserRepos({String username, BuildContext ctx}) async {
    setloading(true);
    try {
      final List<Repos> response =
          await _githubApi.getRepos(username: username);
      _repos = response;
      setloading(false);
      print("REPOSEE====>>$response");
      Navigator.of(ctx).pushNamed(AppRoutes.user_details);
    } catch (e) {
      print("ERROR Repos $e");
      showCustomDialog(ctx, 'Error', e.toString());
      setloading(false);
    }
  }
}
