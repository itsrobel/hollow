import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/widget/drawer.dart';

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Color(0xff251F34),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showDrawer,
            backgroundColor: Color(0xff251F34),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
          body: Center(
            child: Image(
              image: AssetImage(
                'assets/outer_space.png',
              ),
            ),
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
