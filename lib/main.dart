import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sensors_flow/themes/styles.dart';
import 'package:sensors_flow/utils/position_from_accelerometer.dart';
import 'package:sensors_flow/widgets/image_stack.dart';
import 'utils/utility_functions.dart';
import 'widgets/sensorialModule.dart';
import 'themes/app_theme.dart';
import 'package:sensors_flow/widgets/ufo.dart';
import 'package:sensors_flow/utils/ufo_controller.dart';


void main() {
  runApp(const SensorsFlow());
}

class SensorsFlow extends StatelessWidget {
  const SensorsFlow({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SensorsFlow',
      theme: AppTheme.lightTheme,
      home: STHomePage(title: 'Sensors Test'),
    );
  }
}

class STHomePage extends StatefulWidget {
  const STHomePage({super.key, required this.title});
  final String title;

  @override
  State<STHomePage> createState() => _STHomePageState();
}

class _STHomePageState extends State<STHomePage> {
  Timer? timer1;
  Timer? timer2;
  double delta = 5.0;
  List<double> accelerometerVector = [0, 0, 0];
  List<double> gyroscopeVector = [0, 0, 0];
  List<double> positionVector = [0, 0, 0];
  Offset ufoPosition = const Offset(0, 0);
  List<double> rotationVector = [0, 0, 0];
  double zoomValue = 1;
  Size size = Size(90, 90);
  AccelerometerUtility accelerometerUtility = AccelerometerUtility();
  late UFOController ufoController;

  @override
  void initState() {
    ufoController = UFOController(position: ufoPosition, size: size);
    super.initState();
  }

  @override
  void dispose() {
    timer1?.cancel();
    timer2?.cancel();
    super.dispose();
  }
  
  void handleGyroscopeChange(List<double> gyroscopeValues) {
    print("gyroscope values changed");
  }

  void handleAccelerometerChange(List<double> accelerometerValues) {
    accelerometerUtility.position = ufoPosition;
    accelerometerUtility.updatePosition(accelerometerValues, context);
    //ufoController.position = Offset(accelerometerUtility.getPosition()[0], accelerometerUtility.getPosition()[1]);
    setState(() {
      //ufoPosition = Offset(accelerometerUtility.getPosition()[0], accelerometerUtility.getPosition()[1]);
      //positionVector = accelerometerUtility.getPosition();
      ufoPosition = accelerometerUtility.getPosition();
    });
    print("accelerometer callback: ${accelerometerValues.toString()}");
  }

  void stopMovement() {
    timer1?.cancel();
    timer1=null;
  }

  void handleAcceleration() {
    timer2 = Timer.periodic(const Duration(milliseconds: 40), (Timer timer) {
      ufoController.position = ufoPosition;
      ufoController.accelerate(context);
      setState(() {
        size = ufoController.size;
        ufoPosition = ufoController.position;
        //positionVector[0] = ufoController.position.dx;
        //positionVector[1] = ufoController.position.dy;
      });
    });
  }

  void stopAcceleration() {
    timer2?.cancel();
    timer2 = null;
  }

  void handleDeceleration() {
    timer2 = Timer.periodic(const Duration(milliseconds: 40), (Timer timer) {
      ufoController.position = ufoPosition;
      ufoController.decelerate(context);
      setState(() {
        size = ufoController.size;
        //positionVector[0] = ufoController.position.dx;
        //positionVector[1] = ufoController.position.dy;
        ufoPosition = ufoController.position;
      });
    });
  }

  void stopDeceleration() {
    timer2?.cancel();
    timer2 = null;
  }

  void updateZoom() {
    setState(() {
      print("sldoifkjaslñ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: GifStack(zoomValue: zoomValue, positionVector: positionVector, rotationVector: rotationVector)),
          SensorialModule(handleAccelerometerChange: handleAccelerometerChange, handleGyroscopeChange: handleGyroscopeChange),
          UFO(position: ufoPosition, size: size),
          Positioned(
            bottom: 0.0, // Adjust the value as needed
            right: 10,
            width: 300,
            child: GestureDetector(
              onTapDown: (_) => {handleDeceleration()},
              onTapUp: (_) => {stopDeceleration()},
              onTapCancel: ()=>{stopDeceleration()},
              child: ElevatedButton(
                onPressed: () {
                },
                style: mainButton,
                child: const Text(
                  'Brake',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50, // Adjust the value as needed
            right: 10,
            width: 300,
            child: GestureDetector(
              onTapDown: (_) => {handleAcceleration()},
              onTapUp: (_) => {stopAcceleration()},
              onTapCancel: ()=>{stopAcceleration()},
              child: ElevatedButton(
                onPressed: () {
                },
                style: mainButton,
                child: const Text(
                  'Accelerate',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          )
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
