import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_profile/ui/screeens/home_page.dart';
import 'package:flutter_github_profile/ui/screeens/repos_webview.dart';
import 'package:flutter_github_profile/ui/screeens/user_details_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String user_details = '/user-details';
  static const String webview = '/web-view';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(HomeScreen(), settings);
      case user_details:
        return _buildRoute(UserDetailsScreen(), settings);
      case webview:
        return _buildRoute(ReposWebview(), settings);
      default:
        return _buildRoute(Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
