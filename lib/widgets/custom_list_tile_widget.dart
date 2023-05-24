import 'package:flutter/material.dart';
import 'package:sensors_flow/themes/styles.dart';

class CustomListTileWidget extends StatelessWidget {
  final String? listTitle;
  final String? listSubtitle;
  final String? listTrailing;

  const CustomListTileWidget({Key? key, this.listTitle, this.listSubtitle, this.listTrailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Text(listTitle ?? "",
        style: title,
      ),
      title: Text(listSubtitle ?? "",
          style: subtitle),
      trailing: Text(listTrailing ?? ""),
    );
  }
}