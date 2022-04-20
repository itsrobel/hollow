import 'package:flutter/material.dart';
import 'package:hollow_flutter/widget/drawer.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Color(0xFF282a36),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showDrawer,
            backgroundColor: Color(0xFF282a36),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
          body: Center(
              // child: Image(
              //     image: AssetImage('assets/698610.jpg'), fit: BoxFit.cover),
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
