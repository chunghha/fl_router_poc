import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String name;
  final Color color;

  const TabWidget(this.name, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: Center(child: Text(name, style: TextStyle(fontSize: 20))),
      );
}
