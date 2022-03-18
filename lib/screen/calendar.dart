import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/widget/drawer.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CalendarScreen> {
  void showDrawer() {
    print('tapped on show drawer!');
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  bool _showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF44475a),
          appBar: AppBar(
            title: Text('Calendar'),
            centerTitle: true,
            backgroundColor: Color(0xFF282a36),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showDrawer,
            backgroundColor: Color(0xff251F34),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
          body: Center(
              // child: Image(
              //   image: AssetImage(
              //     'assets/outer_space.png',
              //   ),
              // ),
              ),
        ),
        if (_showDrawer)
          DrawerWidget(
            closeFunction: showDrawer,
          ),
      ],
    );
  }
}
