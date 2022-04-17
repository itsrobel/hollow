import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/screen/create.dart';
import 'package:flutter_custom_drawer/screen/login.dart';
import 'package:flutter_custom_drawer/screen/launch.dart';
import 'package:flutter_custom_drawer/screen/map.dart';
import 'package:flutter_custom_drawer/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  //runApp(MyApp());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hollow",
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: Home(),
        // initialRoute: "/",
        // onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}
