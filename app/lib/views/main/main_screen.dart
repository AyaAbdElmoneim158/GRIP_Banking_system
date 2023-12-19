import 'package:app/views/main/widgets/custom_bottom_navigation_bar.dart';
import 'package:app/views/main/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: const CustomPageView(),
    );
  }
}
