// Profile page view.
import 'package:flutter/material.dart';
import '../components/top_nav.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: [TopNav(), Text('Profile page here!')],
        ));
  }
}
