import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/colors_bloc.dart';

class SpaceDetails extends StatefulWidget {
  // final int? mainPercentage;
  // final List<int>? occupiedPercentage;

  //Uses BLoC to get the data for the percentages

  const SpaceDetails({Key? key}) : super(key: key);

  @override
  State<SpaceDetails> createState() => _SpaceDetailsState();
}

class _SpaceDetailsState extends State<SpaceDetails> {
  var optionsList = ['File Types', 'Folders', 'Uploader', 'Location'];
  var _chosenOption = 'File Types';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.all(16),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: false,
                    value: _chosenOption,
                    items: optionsList.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        _chosenOption = value!;
                      });
                      //TODO: Use bloc to change colors
                    },
                  ),
                ),
              ),
            ),
      
            //-------------------- SPACES
            BlocBuilder<ColorsBloc, List<StorageTile>>(
              builder: (context, state) => ColoredBox(
                color: Colors.black,
                child: Column(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(vertical: .1),
                        color: Colors.amber,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item,
        ),
      ),
    );
  }
}
