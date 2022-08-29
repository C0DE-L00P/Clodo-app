import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phony_app/model/User.dart';
import 'package:phony_app/views/pages/page_albums.dart';
import 'package:phony_app/views/pages/page_partners.dart';
import 'package:phony_app/views/pages/page_recycle_bin.dart';
import 'package:phony_app/views/utils/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  User? user;
  HomePage({Key? key,this.user}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //Create a static users list to show in the GridView
  final scaffoldKey = GlobalKey<HomePageState>();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Get User Data from arguments
    // var p = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      key: scaffoldKey,

        // appBar: AppBar(),
        drawerEnableOpenDragGesture: false,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120), // Set this height
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomAppBar(),
          ),
        ),

        //Drawer with LogoutButton

        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: ListView(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/img (1).jpg',
                        width: 52,
                      ),
                    ),
                    // ), //TODO make a golden border around img
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      height: 42,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Mohamed Gamal',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Premium',
                            style: TextStyle(color: Colors.amber, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListTile(
                selected: _currentPageIndex == 0,
                selectedTileColor: Colors.black87,
                leading: const Icon(
                  Icons.photo_album,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Albums',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _currentPageIndex = 0;
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                selected: _currentPageIndex == 1,
                selectedTileColor: Colors.black87,
                // onTap: (this) => this.selected = true;,
                leading: const Icon(
                  Icons.group,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Partners',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

                onTap: () {
                  setState(() {
                    _currentPageIndex = 1;
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                selected: _currentPageIndex == 2,
                selectedTileColor: Colors.black87,
                leading: const Icon(
                  Icons.remove,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Recycle bin',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _currentPageIndex = 2;
                    Navigator.pop(context);
                  });
                },
              ),
              const Divider(
                color: Colors.white10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white38,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white38),
                ),
                onTap: logout,
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white38,
                ),
                title: const Text(
                  'Exit',
                  style: TextStyle(color: Colors.white38),
                ),
                onTap: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          ),
        ),
        body: pages());
  }

  void logout() {
    //remove user from SharedPrefs
    SharedPreferences prefs;
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      prefs.setBool('IS_LOGGED_IN', false);
      // prefs.remove('USER');                //keep the user info for fast login

      //Go back to login screen and Clear Top
      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
    });
  }

  Widget pages() {
    switch (_currentPageIndex) {
      case 0:
        return Albums();
      case 1:
        return Partners();
      case 2:
        return PageRecyclerBin();
      default:
        return Albums();
    }
  }
}
