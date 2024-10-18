// Profile page view.
import 'package:flutter/material.dart';
import '../components/top_nav.dart';

class UserInfo {
  final String username;
  final String authId;

  UserInfo({required this.username, required this.authId});
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static final UserInfo currentUser =
      UserInfo(username: 'Chravis', authId: 'a1b2c3');

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: [const TopNav(), Text(currentUser.username)],
        ));
  }
}
