import 'package:flutter/material.dart';

Container buildBottomNavigationBar(
        {required List<BottomNavigationBarItem> items,
        int currentIndex = 0,
        void Function(int)? onTap}) =>
    Container(
      decoration: buildBottomNavigationBarDecoration(),
      child: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );

BoxDecoration buildBottomNavigationBarDecoration() => BoxDecoration(
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, -4),
            spreadRadius: 0,
            blurRadius: 16,
            color: const Color(0xffBAB0CE).withOpacity(0.2))
      ],
    );
