import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Menu and Search Buttons
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          style: ElevatedButton.styleFrom(primary: const Color(0xfffafafa)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.primary,
              size: 28,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(primary: const Color(0xfffafafa)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
