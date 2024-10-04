import 'package:flutter/material.dart';
import 'components/nav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedIdx = 0;

  // Replace Text with page views.
  static const List<Widget> _views = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: New Chat',
    ),
    Text(
      'Index 2: Profile',
    ),
  ];

  void _onSelect(int index) {
    setState(() {
      selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: Scaffold(
        bottomNavigationBar: NavWidget(
          selectedIndex: selectedIdx,
          onSelect: _onSelect,
        ),
        body: Center(
          child: _views.elementAt(selectedIdx),
        ),
      ),
    );
  }
}
