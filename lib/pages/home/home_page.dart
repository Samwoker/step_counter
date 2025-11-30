import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_counter/common/shared/color.dart';
import 'package:step_counter/pages/home/bloc/home_blocs.dart';
import 'package:step_counter/pages/home/bloc/home_events.dart';
import 'package:step_counter/pages/home/bloc/home_states.dart';
import 'package:step_counter/pages/home/widgets/home_page_widgets.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print("onPedestrianStatusError: $error");
    setState(() {
      _status = "Pedestrian Status not available";
    });
    print(_status);
  }

  void onStepCountError(error) {
    print("onStepCountError: $error");
    setState(() {
      _steps = "Step Count not available";
    });
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;
    if (!granted) {
      granted =
          await Permission.activityRecognition.request() ==
          PermissionStatus.granted;
    }
    return granted;
  }

  Future<void> initPlatformState() async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      //
    }
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    (await _pedestrianStatusStream.listen(
      onPedestrianStatusChanged,
    )).onError(onPedestrianStatusError);
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocs, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.canvas,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withValues(alpha: 0.2),
              //     spreadRadius: 1,
              //     blurRadius: 1,
              //   ),
              // ],
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events),
                  label: "",
                ),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department),
                  label: "",
                ),
              ],

              currentIndex: state.index,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryBrand,
              unselectedItemColor: AppColors.textSecondary,
              onTap: (value) {
                context.read<HomeBlocs>().add(TriggerHomeEvent(value));
              },
            ),
          ),
          body: Container(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: toggleDay()),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(child: stepsWalked(_steps)),
                SliverToBoxAdapter(child: friendsText()),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.w,
                    vertical: 18.h,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 8,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: index == 0
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(20.h),
                                    topRight: Radius.circular(20.h),
                                  )
                                : BorderRadius.circular(0),
                            color: AppColors.canvas,
                          ),
                          child: leaderBoardItems(index),
                        ),
                      );
                    }),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      // mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
