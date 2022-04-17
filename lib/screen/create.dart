import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/utils/constants.dart';
import 'package:flutter_custom_drawer/utils/helper.dart';
import 'package:flutter_custom_drawer/widget/app_button.dart';
import 'package:flutter_custom_drawer/widget/input_widget.dart';
import 'package:flutter_custom_drawer/screen/home.dart';
import 'package:flutter_custom_drawer/screen/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  Future create() async {
    var body = {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'confirmPassword': confirmPasswordController.text,
    };
    var url = Uri.parse('http://localhost:3000/user/create');
    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (jsonResponse['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
            settings: RouteSettings(
              arguments: "Successfully created account",
            ),
          ),
        );
      }
      if (jsonResponse['success'] == false) {
        print('try again bitch');
      }
    } else {
      print('Response body: ${response.statusCode}');
    }
    print('Response body: ${response.body}');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void printLatestValue() {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    print("Username: ${usernameController.text}");
  }

  void initState() {
    super.initState();
    emailController.addListener(printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundPrimary,
      body: SafeArea(
          bottom: false,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
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
                            Text("Create Your New Account",
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
                              Text("User Name",
                                  style: TextStyle(
                                      color: Constants.foregroundHeading)),
                              // InputWidget(
                              //     hintText: "Enter your email address",
                              //     prefixIcon: Icons.login_rounded),
                              TextField(
                                controller: usernameController,
                                style: TextStyle(
                                    color: Constants.foregroundPrimary),
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Desired Username',
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
                              Text("Email",
                                  style: TextStyle(
                                      color: Constants.foregroundHeading)),
                              // InputWidget(
                              //     hintText: "Enter your email address",
                              //     prefixIcon: Icons.login_rounded),
                              TextField(
                                controller: emailController,
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
                                controller: passwordController,
                                obscureText: true,
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
                                height: 25.0,
                              ),
                              Text("Confirm Password",
                                  style: TextStyle(
                                      color: Constants.foregroundHeading)),
                              TextField(
                                controller: confirmPasswordController,
                                obscureText: true,
                                style: TextStyle(
                                    color: Constants.foregroundPrimary),
                                decoration: InputDecoration(
                                  hintText: 'Re-enter Your Password',
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
                              AppButton(
                                text: "Create And Login",
                                type: ButtonType.PRIMARY,
                                onPressed: () {
                                  create();
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => Login()));
                                },
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Text(
                              //     "Forgot Password?",
                              //     textAlign: TextAlign.right,
                              //     style: TextStyle(
                              //       color: Constants.foregroundLink,
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              // ),
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
          )),
    );
  }
}
