import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
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
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    // print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    // print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    // print("onPedestrianStatusError: $error");
    setState(() {
      _status = "Pedestrian Status not available";
    });
    // print(_status);
  }

  void onStepCountError(error) {
    // print("onStepCountError: $error");
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [toggleDay(), SizedBox(height: 20), stepsWalked(_steps)],
        ),
      ),
    );
  }
}
