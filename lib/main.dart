import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/screen/login_new.dart';
// import 'package:flutter_custom_drawer/screen/calendar.dart';
// import 'package:flutter_custom_drawer/screen/doctors.dart';
import 'package:flutter_custom_drawer/screen/home_in.dart';
import 'package:flutter_custom_drawer/screen/map.dart';
import 'package:flutter_custom_drawer/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  //runApp(MyApp());
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Drawer',
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//           fontFamily: 'Poppins'),
//       debugShowCheckedModeBanner: false,
//       home: Login(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Laundry UI",
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

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      });
    case "/map":
      return MaterialPageRoute(builder: (BuildContext context) {
        return MapScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      });
  }
}
