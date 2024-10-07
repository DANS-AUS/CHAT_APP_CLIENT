import 'package:chat/pages/home.dart';
import 'package:flutter/material.dart';
import 'components/nav.dart';
import 'pages/profile.dart';

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
  static final List<Widget> _views = <Widget>[
   Home(),
    const Text(
      'Index 1: New Chat',
    ),
    ProfileView(),
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
