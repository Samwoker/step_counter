import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.background,
    title: Container(
      margin: EdgeInsets.only(top: 36.h),
      child: Center(
        child: Text(
          "Challenge Comparison",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget profileIcon() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 25.h),
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBrand,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "SA",
          style: TextStyle(
            color: AppColors.background,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget challengers() {
  return Container(
    margin: EdgeInsets.only(top: 30.h, right: 25.w, left: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileIcon(),
        SizedBox(width: 50.w),
        Container(
          margin: EdgeInsets.only(top: 50.h),
          child: Text(
            "vs",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 50.w),
        profileIcon(),
      ],
    ),
  );
}

Widget compareSteps() {
  return Container(
    margin: EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w),
    width: 375.w,
    height: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.canvas,
      borderRadius: BorderRadius.circular(30.w),
      boxShadow: [
        BoxShadow(
          color: AppColors.canvas,
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(1, 1),
        ),
      ],
    ),
    child: Column(
      children: [
        _comparisonTypes(),
        _comparisonTypes(),
        _comparisonTypes(),
        _comparisonTypes(),
        _comparisonTypes(),
        _comparisonTypes(),
        _comparisonTypes(),
      ],
    ),
  );
}

Widget _comparisonTypes() {
  return Container(
    margin: EdgeInsets.only(top: 24.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text(
            "8237",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text("Steps today"),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text(
            "2345",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
