import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';
import 'package:step_counter/pages/challenge/widgets/challenge_widgets.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              profileIcon(),
              challengers(),
              Expanded(child: compareSteps()),
            ],
          ),
        ),
      ),
    );
  }
}
