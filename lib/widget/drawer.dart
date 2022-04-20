import 'package:flutter/material.dart';
import 'package:hollow_flutter/screen/calendar.dart';
import 'package:hollow_flutter/screen/chat.dart';
import 'package:hollow_flutter/screen/doctors.dart';
import 'package:hollow_flutter/screen/home.dart';
import 'package:hollow_flutter/screen/login.dart';
import 'package:hollow_flutter/screen/map.dart';
import 'package:hollow_flutter/widget/drawer_item.dart';
import 'package:hollow_flutter/widget/drawer_user.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key, required this.closeFunction}) : super(key: key);
  final Function closeFunction;

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double height;
  late double width;
  double backgroundOpacity = 0;
  bool isCollapsed = true;
  bool isCollapsedAfterSec = true;
  void initializeAnimation() {
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 500,
      ),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    );
    startAnimation();
  }

  void startAnimation() {
    _controller.forward();
    _animation.addListener(() {
      setState(() {
        backgroundOpacity = 0.7 * _animation.value;
      });
    });
  }

  void stopAnimation() {
    _controller.stop();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  void onCollapseTap() {
    if (isCollapsed) {
      Future.delayed(Duration(
        milliseconds: 70,
      )).then((value) {
        setState(() {
          isCollapsedAfterSec = !isCollapsedAfterSec;
        });
      });
    } else if (!isCollapsed) {
      setState(() {
        isCollapsedAfterSec = !isCollapsedAfterSec;
      });
    }
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(
        backgroundOpacity,
      ),
      body: Row(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (ctx, child) {
              return AnimatedContainer(
                duration: Duration(
                  milliseconds: 70,
                ),
                width: (isCollapsed)
                    ? width * .2 * _animation.value
                    : width * .5 * _animation.value,
                margin: EdgeInsets.only(
                  left: width * .06 * _animation.value,
                  top: height * .05,
                  bottom: height * .05,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF44475a),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: (_animation.value > 0.7)
                    ? Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          DrawerUser(
                            name: 'RS',
                          ),
                          DrawerItem(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            icon: Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),

                          DrawerItem(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen()));
                            },
                            icon: Icon(
                              Icons.comment,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          DrawerItem(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CalendarScreen()));
                            },
                            icon: Icon(
                              Icons.event_note,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          DrawerItem(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapScreen()));
                            },
                            icon: Icon(
                              Icons.map,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          DrawerItem(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorScreen()));
                              },
                              icon: Icon(
                                Icons.medical_services_rounded,
                                color: Colors.white,
                                size: 35,
                              )),
                          DrawerItem(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              icon: Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                                size: 35,
                              )),

                          // Spacer(),
                          // // * Bottom Toggle Button
                          // if (_controller.value >= 1)
                          //   DrawerCollapse(
                          //     isCollapsed: isCollapsed,
                          //     onTap: onCollapseTap,
                          //   ),
                        ],
                      )
                    : SizedBox(),
              );
            },
          ),

          // * The left area on the side which will used
          // * to close the drawer when tapped

          Expanded(
            flex: 3,
            child: Container(
              child: GestureDetector(
                onTap: () {
                  reverseAnimation();
                  Future.delayed(
                    Duration(
                      milliseconds: 500,
                    ),
                  ).then(
                    (value) => widget.closeFunction(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
