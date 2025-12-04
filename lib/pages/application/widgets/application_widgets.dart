import 'package:flutter/material.dart';
import 'package:step_counter/pages/challenge/challenge_page.dart';
import 'package:step_counter/pages/home/home_page.dart';

Widget buildPages(int index) {
  List<Widget> widgets = [
    const HomePage(),
    Center(child: Text("medals")),
    const ChallengePage(),
    Center(child: Text("streaks")),
  ];

  return widgets[index];
}

List<BottomNavigationBarItem> bottomTabs = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: ""),
];
