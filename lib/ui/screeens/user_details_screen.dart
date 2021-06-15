import 'package:flutter/material.dart';
import 'package:flutter_github_profile/app/data/models/repos.dart';
import 'package:flutter_github_profile/app/routes/app_routes.dart';
import 'package:flutter_github_profile/notifier/user_provider.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserProvider>().user;
    final List<Repos> reposInfo = context.watch<UserProvider>().repos;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 30),
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(userInfo.avatar_url != null
                    ? userInfo.avatar_url
                    : 'https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg')),
            title: Text(
              userInfo.name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                // userInfo.bio,
                'Description',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text('${userInfo.followers} Followers',
                    style: TextStyle(color: Colors.white)),
                SizedBox(width: 20),
                Text('${userInfo.following} Following',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Repositories',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: reposInfo.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.webview, arguments: item.html_url);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Card(
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
