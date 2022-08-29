import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashyPage extends StatefulWidget {
  const SplashyPage({Key? key}) : super(key: key);

  @override
  State<SplashyPage> createState() => _SplashyPageState();
}

class _SplashyPageState extends State<SplashyPage> {

  var timer;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) => setState(() {
          String pathToGo = '/login';

          //Check shared pref for it
          if (prefs.getBool('IS_LOGGED_IN') != null) {
            pathToGo = prefs.getBool('IS_LOGGED_IN')! ? '/home' : '/login';
          }

          //Automatically Switch to next Page
          timer = Timer(Duration(seconds: 3), (){
            timer.cancel();
            Navigator.pushNamedAndRemoveUntil(context, pathToGo,(r)=>false);
            });

          //NOTICE: any change in init state YOU MUST CLOSE THE APP AND RE-RUN
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.cloud,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Clodo",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      )),
    );
  }
}
