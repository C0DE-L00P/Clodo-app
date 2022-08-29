import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestDrawer extends StatelessWidget {
  const TestDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(child: TextButton(onPressed: (){
        
      }, child: const Text('Open Drawer'))),
    );
  }
}