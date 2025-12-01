import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Text(
          "Login",
          style: TextStyle(
            color: AppColors.primaryBrand,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget buildTextField(
  String hintText,
  String textType,
  void Function(String value) func,
) {
  return Container(
    margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 16.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      // color: AppColors.primaryBrand,
      borderRadius: BorderRadius.circular(25.w),
      border: Border.all(color: AppColors.primaryBrand),
    ),
    child: SizedBox(
      width: 270.w,
      height: 50.h,
      child: TextField(
        onChanged: (value) => func(value),
        keyboardType: TextInputType.multiline,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
        ),
        autocorrect: false,
        obscureText: textType == "password" ? true : false,
      ),
    ),
  );
}

Widget buildButton(String buttonText) {
  return Container(
    margin: EdgeInsets.only(top: 24.h, left: 25.w, right: 25.w),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryBrand,
      borderRadius: BorderRadius.circular(50.w),
    ),
    child: GestureDetector(
      onTap: () {},
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.background,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget buildThirdPartyButtons(String btnText, String imageName) {
  return Container(
    margin: EdgeInsets.only(left: 25.w, right: 25.w),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryBrand),
      borderRadius: BorderRadius.circular(50.w),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18.w),
          width: 25.w,
          height: 25.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/$imageName.png"),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(left: 40.w),
            child: Text(
              btnText,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
