import 'package:flutter/material.dart';
import 'package:step_counter/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [toggleDay(), SizedBox(height: 20), stepsWalked()],
        ),
      ),
    );
  }
}
