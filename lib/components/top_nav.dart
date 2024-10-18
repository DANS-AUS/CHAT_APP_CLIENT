import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
