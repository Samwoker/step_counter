import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: 0,
    leading: Container(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryBrand,
            shape: BoxShape.circle,
          ),
          child: const Center(
            // Avatar text replaced with image
            child: Text(
              "SA",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    ),
    title: Container(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The name will be replaced dynamically
          Text(
            "Good Morning Samuel",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "Your daily step journey starts here!",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.emoji_events, color: AppColors.textSecondary),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 28.w,
            height: 28.h,
            decoration: const BoxDecoration(
              color: AppColors.alert,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 18),
          ),
        ),
      ),
    ],
  );
}

Widget toggleDay() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 25.h),
      width: 150.w,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(35.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _toggleDayText("Week"),
          _toggleDayText("Today", isActive: true),
          _toggleDayText("24.hr"),
        ],
      ),
    ),
  );
}

Widget _toggleDayText(String text, {bool isActive = false}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: isActive ? AppColors.alert : AppColors.textSecondary,
        fontSize: isActive ? 18 : 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget stepsWalked(steps) {
  return Container(
    margin: const EdgeInsets.only(top: 8),
    child: Column(
      children: [
        Text(
          "Steps Today",
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          steps,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 60.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.nordic_walking,
                    size: 32,
                    color: AppColors.primaryBrand,
                  ),
                  Text(
                    "Distance",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "3 mi",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.emoji_events, size: 32),
                  Text(
                    "Medals",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "04",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget friendsText() {
  return Container(
    margin: EdgeInsets.only(left: 25, right: 25, top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.person, color: AppColors.textSecondary, size: 30),
              Text(
                "Friends",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.canvas,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Add Walkers",
                style: TextStyle(
                  color: AppColors.alert,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    color: AppColors.alert,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
