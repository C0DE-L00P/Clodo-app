import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phony_app/views/pages/page_albums.dart';
import 'package:phony_app/views/pages/page_space_details.dart';

import 'bloc/colors_bloc.dart';
import 'testDrawer.dart';
import 'views/pages/home.dart';
import 'views/pages/login.dart';
import 'views/pages/splashy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //To make scroll by dragging effect on PC as well
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),

      //Custom Settings for Hero Animation Duration NOT WORKING
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/home") {
      //     return PageRouteBuilder(
      //         settings:
      //             settings,
      //         pageBuilder: (_, __, ___) => HomePage(),
      //         transitionDuration: Duration(seconds: 5),
      //         transitionsBuilder: (_, a, __, c) =>
      //             FadeTransition(opacity: a, child: c));
      //   }
      //   // Unknown route
      //   return MaterialPageRoute(builder: (_) => HomePage());
      // },

      title: 'Clodo | Cloud Storage',
      theme: ThemeData(
        brightness: Brightness.light,
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark
        // ),
        // primarySwatch: buildMaterialColor(const Color(0xfffca120)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff041527),
          secondary: const Color(0xfffca120),
        ),
      ),
      routes: {
        '/': (context)=> const SplashyPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/blocks': (context) => BlocProvider(create: (context)=> ColorsBloc([]),child:const SpaceDetails()),
      },
    );
  }
}


//Hex to Material Color for Swatch

// MaterialColor buildMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map<int, Color> swatch = {};
//   final int r = color.red, g = color.green, b = color.blue;
//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   strengths.forEach((strength) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//       1,
//     );
//   });
//   return MaterialColor(color.value, swatch);
// }
