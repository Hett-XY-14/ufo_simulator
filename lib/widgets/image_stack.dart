import 'package:flutter/material.dart';

class GifStack extends StatelessWidget {
  List<double> positionVector;
  List<double> rotationVector;
  double zoomValue;

  GifStack({
    Key? key,
    required this.zoomValue,
    required this.positionVector,
    required this.rotationVector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image dust = Image.asset('lib/assets/images/dust.gif');
    Image explosion = Image.asset('lib/assets/images/explosion.gif');
    Image background = Image.asset('lib/assets/images/sensors_background.gif', fit: BoxFit.cover,);
    Image bunny = Image.asset('lib/assets/images/bunny.gif');

    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          left: 0,
          child: SizedBox(
            width: 200,
            height: 200,
            child: background,
          ),
        ),
        Positioned(
          bottom: 440,
          right: 90,
          child: SizedBox(
            width: 30,
            height: 30,
            child: bunny,
          ),
        ),
      ],
    );
  }
}

