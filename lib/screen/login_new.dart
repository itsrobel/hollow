import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/utils/constants.dart';
import 'package:flutter_custom_drawer/utils/helper.dart';
import 'package:flutter_custom_drawer/widget/app_button.dart';
import 'package:flutter_custom_drawer/widget/input_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _LoginFormState extends State<Login> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  void _printLatestValue(TextEditingController controler) {
    print('Second text field: ${controler.text}');
  }

  void initState() {
    super.initState();

    // Start listening to changes.
    // EmailController.addListener(_printLatestValue(EmailController));
    // PasswordController.addListener(_printLatestValue(PasswordController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundPrimary,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  // child: Image.asset(
                  //   "assets/images/washing_machine_illustration.png",
                  // ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.keyboard_return_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text("Log in to your account",
                                style: TextStyle(
                                    color: Constants.foregroundImportant,
                                    fontSize: 18.0)

                                // style: Theme.of(context).textTheme.headline6
                                // .copyWith(
                                //   fontWeight: FontWeight.w600,
                                //   color: Colors.white,
                                // ),
                                )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight:
                                MediaQuery.of(context).size.height - 180.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            color: Constants.backgroundSecondary,
                          ),
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Lets make a generic input widget
                              Text("Email",
                                  style: TextStyle(
                                      color: Constants.foregroundHeading)),
                              // InputWidget(
                              //     hintText: "Enter your email address",
                              //     prefixIcon: Icons.login_rounded),
                              TextField(
                                controller: EmailController,
                                style: TextStyle(
                                    color: Constants.foregroundPrimary),
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Email',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Constants.foregroundPrimary),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.foregroundInput),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.foregroundLink),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.foregroundInputError),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 25.0,
                              ),
                              Text("Password",
                                  style: TextStyle(
                                      color: Constants.foregroundHeading)),
                              TextField(
                                controller: PasswordController,
                                style: TextStyle(
                                    color: Constants.foregroundPrimary),
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Password',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Constants.foregroundPrimary),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.foregroundInput),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.foregroundLink),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.foregroundInputError),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Forgot Password?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Constants.foregroundLink,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              // AppButton(
                              //   type: ButtonType.PRIMARY,
                              //   text: "Log In",
                              //   onPressed: () {
                              //     nextScreen(context, "/dashboard");
                              //   },
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Fill this out in the next step.
  }
}

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//   }
// }
