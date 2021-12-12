import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: icon,
        ));
  }
}
