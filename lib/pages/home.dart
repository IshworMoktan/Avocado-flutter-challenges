import 'package:avocado/pages/tabs/main_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainTabbedPage(),
    );
  }
}