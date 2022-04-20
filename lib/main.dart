import 'package:flutter/material.dart';
import 'package:hollow_flutter/screen/launch.dart';
import 'package:hollow_flutter/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
