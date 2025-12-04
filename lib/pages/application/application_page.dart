import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';
import 'package:step_counter/pages/application/bloc/app_blocs.dart';
import 'package:step_counter/pages/application/bloc/app_events.dart';
import 'package:step_counter/pages/application/bloc/app_states.dart';
import 'package:step_counter/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                color: AppColors.canvas,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
              ),
              child: BottomNavigationBar(
                items: bottomTabs,
                currentIndex: state.index,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryBrand,
                unselectedItemColor: AppColors.textSecondary,
                onTap: (value) {
                  context.read<AppBlocs>().add(TriggerAppEvent(value));
                },
              ),
            ),
            body: buildPages(state.index),
          ),
        );
      },
    );
  }
}
