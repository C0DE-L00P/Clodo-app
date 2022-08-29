import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:phony_app/views/utils/album_card.dart';
import 'dart:async';

import '../utils/Album.dart';
import '../utils/partialFilledIcon.dart';

class Albums extends StatefulWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> with SingleTickerProviderStateMixin {
  double _occupied = 0.30, _spaceOccupied = 0;
  String? lastSync = '3/27/2022'; //TODO: get from sharedPrefs
  AnimationController? _syncAnimationController;
  double _syncRotate = 0;

  void AnimateSpaceOccupied() {
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_occupied <= _spaceOccupied) {
        timer.cancel();
      } else {
        setState(() {
          _spaceOccupied = _spaceOccupied + 0.01;
        });
      }
    });
  }

  @override
  void initState() {
    AnimateSpaceOccupied();

    _syncAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Space Row and Cloud
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Info By the Cloud

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, //TODO this line is not working
                          children: [
                            //TODO take the user info from the transition
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Hi, Mohamed',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black87),
                                ),
                                Text('Sync your files to keep a copy of them',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black38)),
                              ],
                            ),

                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    bool syncDone = true;
                                    int dure = 0;
                                    Timer.periodic(Duration(milliseconds: 20),
                                        (timer) {
                                      syncDone = ++dure ==
                                          100; //TODO this mechanism is a placeholder for syncing process

                                      if (!syncDone) {
                                        setState(() {
                                          _syncRotate = _syncRotate - 10 / 360;
                                        });
                                      } else {
                                        timer.cancel();

                                        //To Get Today Date
                                        setState(() {
                                          lastSync = CalcTodayDate();
                                        });
                                      }
                                    });
                                  },
                                  icon: RotationTransition(
                                    turns:
                                        new AlwaysStoppedAnimation(_syncRotate),
                                    child: const Icon(Icons.sync),
                                  ),
                                  label: const Text('Sync Now'),
                                ),
                                Text(
                                  '  Last: $lastSync',
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 12),
                                ), //TODO Make date more dynamic
                              ],
                            )
                          ],
                        ),
                      ),

                      //The Cloud

                      Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              PartialFilledIcon(
                                  Icons.cloud,
                                  (MediaQuery.of(context).size.width / 2) -
                                              60 >
                                          300
                                      ? 260
                                      : (MediaQuery.of(context).size.width /
                                              2) -
                                          60,
                                  Theme.of(context).colorScheme.primary,
                                  _spaceOccupied),
                              Positioned(
                                  child: Text(
                                '${(_spaceOccupied * 100).round()}%',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                color: Theme.of(context).colorScheme.primary,
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Used',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                color: Color(0xffe0e0e0),
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Free',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Albums',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: (){showAlertDialog(context);},
                            icon: const Icon(Icons.filter_list),
                          ),
                        ],
                      ), //TODO: size of this button padding should be adjusted
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 24),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => AlbumCard(
                      title: 'PlaceHolder',
                      titleColor: Colors.white,
                      img:
                          'assets/images/wallpaperflare.com_wallpaper (11).jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String CalcTodayDate() {
    final now = DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return formatter;
  }

  showAlertDialog(BuildContext context) {

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Filter"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(title: const Text("All Files"),onTap:()=>filterateFiles(0)),
          ListTile(title: const Text("Date by Day"),onTap:()=>filterateFiles(1)),
          ListTile(title: const Text("Date by Month"),onTap:()=>filterateFiles(2)),
          ListTile(title: const Text("Date by Year"),onTap:()=>filterateFiles(3)),
          ListTile(title: const Text("Location"),onTap:()=>filterateFiles(4)),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void filterateFiles(int filterIndex) {
    switch (filterIndex) {
      case 0:
        
        break;
      case 1:
        
        break;
      case 2:
        
        break;
      case 3:
        
        break;
      case 4:
        
        break;
      default:
        
    }
  }
}
