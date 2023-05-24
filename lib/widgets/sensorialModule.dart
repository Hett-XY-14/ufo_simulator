import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:all_sensors2/all_sensors2.dart';
import 'custom_list_tile_widget.dart';
import 'package:sensors_flow/themes/styles.dart';


typedef OnSensorStateCallback = void Function(List<double> values)?;

class SensorialModule extends StatefulWidget {
  OnSensorStateCallback? handleAccelerometerChange;
  OnSensorStateCallback? handleGyroscopeChange;

  SensorialModule({required this.handleAccelerometerChange, required this.handleGyroscopeChange, Key? key}) : super(key: key);

  @override
  State<SensorialModule> createState() => _SensorialModuleState(handleAccelerometerChange: handleAccelerometerChange, handleGyroscopeChange: handleGyroscopeChange);
}

class _SensorialModuleState extends State<SensorialModule> {
  _SensorialModuleState({required this.handleAccelerometerChange, required this.handleGyroscopeChange});

  List<double> accelerometerValues = [0, 0, 0];
  List<double> gyroscopeValues = [0, 0, 0];
  List<StreamSubscription<dynamic>> streamSubscriptions = <StreamSubscription<dynamic>>[];
  late OnSensorStateCallback handleAccelerometerChange;
  late OnSensorStateCallback handleGyroscopeChange;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color:  Colors.black.withOpacity(0.5),
          width: 411,
          height: 80,
          child: ListView(
            shrinkWrap: true,
            children: [
              const CustomListTileWidget(
                listTitle: "",
                listSubtitle: " acceleration ",
              ),
              CustomListTileWidget(
                listTitle: "",
                listSubtitle: "X: ${accelerometerValues[0].toStringAsFixed(6)} m/s^2",
                listTrailing: "",
            ),
              CustomListTileWidget(
                  listTitle: "",
                  listSubtitle: "Y: ${accelerometerValues[1].toStringAsFixed(6)} m/s^2",
                  listTrailing: "",
              ),
              CustomListTileWidget(
                  listTitle: "",
                  listSubtitle: "Z: ${accelerometerValues[2].toStringAsFixed(6)} m/s^2",
                  listTrailing: "",
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
      streamSubscriptions.add(accelerometerEvents!.listen(
              (AccelerometerEvent event) {
            setState(() {
              accelerometerValues = <double>[event.x, event.y, event.z];
            });
              handleAccelerometerChange?.call(accelerometerValues);
          })
      );

      streamSubscriptions.add(gyroscopeEvents!.listen(
              (GyroscopeEvent event) {
            setState(() {
              gyroscopeValues = <double>[event.x, event.y, event.z];
            });
              handleGyroscopeChange?.call(gyroscopeValues);
          })
      );
    }
}

