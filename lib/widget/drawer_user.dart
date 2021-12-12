import 'package:flutter/material.dart';

class DrawerUser extends StatefulWidget {
  const DrawerUser({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  _DrawerUserState createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Center(
      child: FittedBox(
        child: Text(
          (widget.name),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
