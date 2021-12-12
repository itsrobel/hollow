import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/widget/drawer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
            title: Text('Chat'),
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
