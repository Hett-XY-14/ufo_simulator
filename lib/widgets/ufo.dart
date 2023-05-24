import 'package:flutter/material.dart';
import 'package:sensors_flow/themes/styles.dart';
class UFO extends StatelessWidget {
  final Offset position;
  final Size size;
  const UFO({Key? key, required this.position, required this.size}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned(
          bottom:  position.dy,
          left: position.dx,
          child: Image.asset(
            'lib/assets/images/ufo.gif',
            width: size.width,
            height: size.height,
          ),
        ),
        Positioned(
            top: 90,
            left: 0 ,
            width: 190,
            height: null,
            child: Container(
              //color:  Color.fromARGB(180, 0, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: Text('   X :',
                      style: title
                    ),
                    title: Text("${position.dx.toStringAsFixed(3)} px",
                      style: subtitle),
                  ),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    leading: Text('   Y :',
                      style: title
                    ),
                    title: Text("${position.dy.toStringAsFixed(3)} px",
                      style: subtitle),
                  )
                ],
              ),
            ))
          ],
        );
  }
}
