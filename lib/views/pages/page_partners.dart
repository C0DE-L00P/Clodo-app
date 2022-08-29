import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/User.dart';

class Partners extends StatefulWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  State<Partners> createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Partners',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'whom can access your data',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Grid View with the users
          //TODO: make this dynamic
          Expanded(
            child: GridView.builder(
                itemCount: friends.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // maxCrossAxisExtent: 200,
                  //     childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                  friends[index].img ??
                                      'assets/images/placeholder.png'),
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
                              IconButton(
                                  onPressed: () => print('calling'),
                                  icon: const Icon(Icons.call),
                                  color: Theme.of(context).colorScheme.primary),
                              IconButton(
                                  onPressed: () => print('calling'),
                                  icon: const Icon(Icons.message),
                                  color: Theme.of(context).colorScheme.primary),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ElevatedButton(
              //   onPressed: logout,
              //   style: ElevatedButton.styleFrom(
              //       primary: Colors.red), //To change button background color
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: const [
              //       Icon(Icons.logout),
              //       Text(
              //         'Logout',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ],
              //   ),
              // ),
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
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
