import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/utils/constants.dart';
import 'package:flutter_custom_drawer/utils/helper.dart';
import 'package:flutter_custom_drawer/widget/app_button.dart';
import 'package:flutter_custom_drawer/widget/input_widget.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_custom_drawer/screen/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  const Login({Key? key, msg}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _LoginFormState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final storage = new FlutterSecureStorage();

  Future auto() async {
    String? password = await storage.read(key: "password");
    String? email = await storage.read(key: "email");
    print(password);

    var body = {"email": email, "password": password};
    var url = Uri.parse("http://localhost:3000/user/login");
    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (jsonResponse['success'] == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      if (jsonResponse['success'] == false) {
        print('try again bitch');
      }
    }
  }

  Future login() async {
    // String? value = await storage.read(key: "password");
    // print("password: $value");
    var body = {
      "email": emailController.text,
      "password": passwordController.text
    };
    var url = Uri.parse("http://localhost:3000/user/login");
    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (jsonResponse['success'] == true) {
        await storage.write(key: "password", value: passwordController.text);
        await storage.write(key: "email", value: emailController.text);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
    super.dispose();
  }

  void main() async {
    String? value = await storage.read(key: "password");
    print(value);
  }

  void initState() {
    super.initState();
    auto();
  }

  @override
  Widget build(BuildContext context) {
    var todo = ModalRoute.of(context)!.settings.arguments;
    todo ??= "deeznutz";
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
                            Text(todo.toString(),
                                style: TextStyle(
                                    color: Constants.foregroundImportant,
                                    fontSize: 18.0)),
                            Text("Log in to your account",
                                style: TextStyle(
                                    color: Constants.foregroundImportant,
                                    fontSize: 18.0))
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
                                height: 15.0,
                              ),
                              AppButton(
                                text: "Log In",
                                type: ButtonType.PRIMARY,
                                onPressed: () {
                                  login();
                                },
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
  }
}
