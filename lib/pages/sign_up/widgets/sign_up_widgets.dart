import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Container(
      margin: EdgeInsets.only(top: 20.h, left: 90.w),
      child: Text(
        "SignUp",
        style: TextStyle(
          color: AppColors.primaryBrand,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
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
    margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 22.h),
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

Widget buildButton(String buttonText, void Function() func) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top: 24.h, left: 25.w, right: 25.w),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBrand,
        borderRadius: BorderRadius.circular(50.w),
      ),
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
    margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 22.h),
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

Widget signUpAndSignInLinks(
  String infoText,
  String redirectLinkText,
  void Function() func,
) {
  return Container(
    margin: EdgeInsets.only(top: 12.sp),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 8.w),
          child: Text(
            infoText,
            style: TextStyle(color: AppColors.textPrimary, fontSize: 16.sp),
          ),
        ),
        GestureDetector(
          onTap: func,
          child: Text(
            redirectLinkText,
            style: TextStyle(
              color: AppColors.primaryBrand,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryBrand,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    ),
  );
}
