import 'package:flutter/material.dart';
import 'package:flutter_github_profile/app/data/models/user_profile.dart';
import 'package:flutter_github_profile/notifier/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final model = context.watch<UserProvider>();

    //only read nothing return any thing
    Future<void> fetchUserInfo() async {
      await context
          .read<UserProvider>()
          .getUserProfile(username: usernameController.text, ctx: context);
      await context
          .read<UserProvider>()
          .getUserRepos(username: usernameController.text, ctx: context);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: NetworkImage(
                  'https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg'),
              height: 100,
              width: 100),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: usernameController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.white)),
                hintText: 'Enter',
                hintStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
                onPressed: () => fetchUserInfo(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get My Profile'),
                      SizedBox(width: 40),
                      model.isLoading
                          ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
