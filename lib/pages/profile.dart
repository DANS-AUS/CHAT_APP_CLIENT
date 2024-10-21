// Profile page view.
import 'package:flutter/material.dart';
import '../components/top_nav.dart';

class UserInfo {
  final String username;
  final String fullName;
  final String authId;

  UserInfo(
      {required this.username, required this.fullName, required this.authId});
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static final UserInfo currentUser = UserInfo(
      username: 'JohnDoe', fullName: 'Johknee Dough', authId: 'a1b2c3');

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: [
            const TopNav(),
            const SizedBox(
              height: 100,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 50,
              child: const Text(
                'JD',
                style: TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              currentUser.fullName,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ));
  }
}
