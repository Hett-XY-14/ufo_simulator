import 'package:flutter/material.dart';

class UFOController {
  // Offset to store the position of the ufo on the screen
  Offset _position;

  // Size to store the size of the ufo image
  Size _size;

  // Constructor
  UFOController({required Offset position, required Size size})
      : _position = position,
        _size = size;

  // Function to get the current position of the ufo
  Offset get position => _position;

  // Function to get the size of the ufo
  Size get size => _size;

  // Function to set the current position of the ufo
  set position(Offset newPosition) {
    _position = newPosition;
  }

  // Function to set the size of the ufo
  set size(Size newSize) {
    _size = newSize;
  }

  // Function to accelerate the ufo towards the horizon
  void accelerate(BuildContext context) {
    final double horizonLineY = 420;
    final double meridianLineX = 200;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Update the position of the ufo
    // Update the X displacement
    double xDisplacement = _position.dx < meridianLineX
        ? _position.dx + (meridianLineX - _position.dx) / 8
        : _position.dx - (_position.dx - meridianLineX) / 8;
    xDisplacement = xDisplacement < screenWidth - _size.width
        ? xDisplacement
        : screenWidth - _size.width;

    // Update the Y displacement
    double yDisplacement = _position.dy < horizonLineY
        ? _position.dy + ((horizonLineY - _position.dy) / 13)
        : _position.dy - (_position.dy - horizonLineY) / 13;
    yDisplacement = yDisplacement < screenHeight - _size.height
        ? yDisplacement
        : screenHeight - _size.height;

    // Update the position of the ufo
    _position = Offset(xDisplacement, yDisplacement);
    // Update the size of the ufo
    if (_size.width > 25 && _size.height > 25) {
      _size = Size(_size.width - 20 * _size.width / screenWidth,
          _size.height - 20 * _size.height / screenHeight);
    }
  }

  // Function to accelerate the ufo towards the horizon
  void decelerate(BuildContext context) {
    final double horizonLineY = 420;
    final double meridianLineX = 205;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Update the axis displacements of the ufo
    // Update the X displacement
    double xDisplacement = _position.dx < meridianLineX
        ? _position.dx - (meridianLineX - _position.dx) / 8
        : _position.dx + (_position.dx - meridianLineX) / 8;
    xDisplacement = xDisplacement < screenWidth - _size.width / 2
        ? xDisplacement
        : screenWidth - _size.width / 2;

    // Update the Y displacement
    double yDisplacement = _position.dy < horizonLineY
        ? _position.dy + ((horizonLineY - _position.dy) / 13)
        : _position.dy - (_position.dy - horizonLineY) / 13;
    yDisplacement = yDisplacement < screenHeight - _size.height / 2
        ? yDisplacement
        : screenHeight - _size.height / 2;

    // Update the position of the ufo
    _position = Offset(xDisplacement, yDisplacement);

    // Update the size of the ufo
    if (_size.width < 250 && _size.height < 250) {
      _size = Size(_size.width + 20 * _size.width / screenWidth,
          _size.height + 20 * _size.height / screenHeight);
    }
  }
}
