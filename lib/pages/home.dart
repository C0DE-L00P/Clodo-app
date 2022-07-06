import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phony_app/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Create a static users list to show in the GridView
  List<User> friends = [
    User(
        email: 'mohamedgyaseen@gmail.com',
        password: '12345678',
        username: 'mohamedg',
        firstname: 'Mohamed',
        lastname: 'Gamal',
        img: 'assets/images/img (1).jpg',
        phone: '01020624331'),
    User(
        email: 'ahmedawad@gmail.com',
        password: '12345678',
        username: 'ahmed44',
        firstname: 'Ahmed',
        lastname: 'Awad',
        img: 'assets/images/img (2).jpg',
        phone: '01023333322'),
    User(
        email: 'sarah_megahed@gmail.com',
        password: '12345678',
        username: 'saraaa',
        firstname: 'Sarah',
        lastname: 'Megahed',
        img: 'assets/images/img (3).jpg',
        phone: '010552333333'),
    User(
        email: 'mamdouh_gaber233@gmail.com',
        password: '12345678',
        username: 'mam_douh',
        firstname: 'Steve',
        lastname: 'Austen',
        img: 'assets/images/img (4).jpg',
        phone: '01020538885'),
  ];

  @override
  Widget build(BuildContext context) {
    //Get User Data from arguments
    // var p = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      //Drawer with LogoutButton

      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const Text(
            'Partners',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'whom can access your data',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20,),
          //Grid View with the users
          Expanded(
            child: GridView.builder(
                itemCount: friends.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //     maxCrossAxisExtent: 200,
                  //     childAspectRatio: 3 / 2,
                  //     crossAxisSpacing: 20,
                  //     mainAxisSpacing: 20
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16,bottom:8, right:8, left:8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(friends[index].img?? 'assets/images/placeholder.png'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${friends[index].firstname!} ${friends[index].lastname!}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //TODO make them clickable
                                //TODO add a feedback for click
                                Icon(Icons.call,
                                    color: Theme.of(context).colorScheme.primary),
                                Icon(Icons.message,
                                    color: Theme.of(context).colorScheme.primary),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: logout,
                style: ElevatedButton.styleFrom(
                    primary: Colors.red), //To change button background color
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.logout),
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                onPressed: () {
                  //Navigate back to splashy
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.settings_backup_restore_sharp),
                    Text(
                      'Back to Splashy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
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
}
