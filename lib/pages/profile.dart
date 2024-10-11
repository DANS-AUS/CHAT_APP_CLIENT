// Profile page view.
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.group_add_outlined),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: SearchBar(
                    leading: Icon(Icons.search),
                  ),
                ),
                Icon(Icons.notifications_outlined)
              ],
            )
          ],
        ));
  }
}
