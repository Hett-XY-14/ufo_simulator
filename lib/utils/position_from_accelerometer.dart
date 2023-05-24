import 'package:flutter/cupertino.dart';

class AccelerometerUtility {
  List<double> _positionValues = [0.0,0.0,0.0];
  Offset _position = Offset(0, 0);

  Offset get position => _position;

  // Function to set the current position of the drone
  set position(Offset newPosition) {
    _position = newPosition;
  }

  void updatePosition(List<double> accelerometerValues, BuildContext context) {
    updatePositionX(accelerometerValues[0], context);
    updatePositionY(accelerometerValues[1], context);
  }

  Offset getPosition() {
    //return _positionValues;
    return Offset(_positionValues[0], _positionValues[1]);
  }

  void updatePositionX(double x, BuildContext context) {
    double screenBounds = MediaQuery.of(context).size.width;
    double displacementX = -1.2*x;
    _positionValues[0] = _position.dx + displacementX;
    _positionValues[0] = _positionValues[0] > screenBounds ? screenBounds : _positionValues[0] < 0 ? 0 : _positionValues[0];
  }

  void updatePositionY(double y, BuildContext context) {
    double screenBounds = MediaQuery.of(context).size.height;
    double displacementY = 1.3*y;
    _positionValues[1] = _position.dy + displacementY;
    _positionValues[1] = _positionValues[1] > screenBounds ? screenBounds : _positionValues[1] < 0 ? 0 : _positionValues[1];
  }
}
