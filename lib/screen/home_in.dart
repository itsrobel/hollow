import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/utils/constants.dart';
import 'package:flutter_custom_drawer/widget/app_button.dart';
import 'package:flutter_custom_drawer/utils/helper.dart';
import 'package:flutter_custom_drawer/screen/login_new.dart';
import 'package:animated_background/animated_background.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundPrimary,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 100.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      // decoration: BoxDecoration(
                      //   // image: DecorationImage(
                      //   //   image: AssetImage("assets/images/cloth_faded.png"),
                      //   // ),
                      // ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      // child: Image.asset(
                      //   "assets/images/illustration.png",
                      //   scale: 1.1,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                decoration: BoxDecoration(
                  color: Constants.backgroundSecondary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "Welcome to Laundree!",
                      style: TextStyle(
                          color: Constants.foregroundImportant, fontSize: 18.0),
                      // style: Theme.of(context).textTheme.headline6.copyWith(
                      //       fontWeight: FontWeight.w600,
                      //       color: Color.fromRGBO(19, 22, 33, 1),
                      //     ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "This is the first version of our laundry app. Please sign in or create an account below.",
                      style: TextStyle(
                        color: Constants.foregroundPrimary,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    // Let's create a generic button widget
                    AppButton(
                      text: "Log In",
                      type: ButtonType.PRIMARY,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    AppButton(
                      text: "Create an Account",
                      type: ButtonType.PRIMARY,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
