// Profile page view.
import 'package:chat/components/switch.dart';
import 'package:flutter/material.dart';
import '../components/top_nav.dart';

class UserInfo {
  final String username;
  final String fullName;
  final String authId;

  UserInfo(
      {required this.username, required this.fullName, required this.authId});
}

class SwitchModel extends ValueNotifier<bool> {
  SwitchModel() : super(true);

  void onSwitchChange() {
    value = !value;
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static UserInfo currentUser =
      UserInfo(username: 'JohnDoe', fullName: 'John Doe', authId: 'a1b2c3');

  static bool val = true;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  SwitchModel switchModel = SwitchModel();

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
              ProfileView.currentUser.fullName,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            SwitchWidget(
                titleOne: 'SETTINGS',
                titleTwo: 'FRIENDS',
                value: switchModel.value,
                onTap: (bool val) {
                  setState(() {
                    switchModel.onSwitchChange();
                  });
                })
          ],
        ));
  }
}
