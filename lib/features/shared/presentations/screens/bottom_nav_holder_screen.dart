import 'package:flutter/material.dart';

class BottomNavHolderScreen extends StatefulWidget {

  static const String name = '/bottom-nav-holder';
  const BottomNavHolderScreen({super.key});

  @override
  State<BottomNavHolderScreen> createState() => _BottomNavHolderScreenState();
}

class _BottomNavHolderScreenState extends State<BottomNavHolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(destinations: []),
    );
  }
}
