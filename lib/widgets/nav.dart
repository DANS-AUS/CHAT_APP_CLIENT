import 'package:flutter/material.dart';

class NavWidget extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onSelect;

  const NavWidget({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'ADD'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: 'PROFILE'),
      ],
      currentIndex: selectedIndex,
      onTap: onSelect,
    );
  }
}
