import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phony_app/model/Album.dart';
import 'bloc_event.dart';
import 'dart:ui';

class ColorsBloc extends Bloc<GroupedBy, List<StorageTile>> {
  ColorsBloc(List<StorageTile> initialState) : super(initialState) {
    //get the percentage of every space

    List<Color> colorsToChooseFrom = const [
      Color(0xff98c5f4),
      Color(0xff86bbf3),
      Color(0xff62a7ef),
      Color(0xff519ded),
      Color(0xff3f93eb),
      Color(0xff3f93eb),
      Color(0xff2d88e9),
      Color(0xff1b7ee8),
      Color(0xff1675d9),
      Color(0xff146bc7),
      Color(0xff1362b5),
      Color(0xff1158a4),
      Color(0xff0f4e92),
      Color(0xff0d4580),
      Color(0xff0b3b6e),
      Color(0xff09325c),
      Color(0xff08284b),
      Color(0xff061f39),
      Color(0xff041527),
      Color(0xff020b15),
      Color(0xff000203),
    ]; //20 Colors

    //the higher the percentage the darker the color is
    // 400 mb/4000 mb
    // 4000/20 = 200 mb

    //Then 400 == colors[2] to get it 400/200 == 2

    //Ex: 563 mb folder
    //563/200 == 2

//TODO: this definitely should be more dynamic (should be data from API)
//TODO: get images for these folders

    List<Album> albums = [
      Album(
          id: 1,
          title: 'Gonna Festival',
          titleColor: Colors.white,
          latestUpdate: '12/5/2022',
          sizes: {'imgSize': 400000, 'vidSize': 668044, 'totalSize': 1068044},
          imgCount: 331,
          vidCount: 7),
      Album(
          id: 2,
          title: 'Graduation Party',
          titleColor: Colors.white,
          latestUpdate: '6/14/2021',
          sizes: {'imgSize': 804538, 'vidSize': 760000, 'totalSize': 1564538},
          imgCount: 78,
          vidCount: 3),
      Album(
          id: 3,
          title: 'TEDx talk',
          titleColor: Colors.white,
          latestUpdate: '7/6/2021',
          sizes: {'imgSize': 142007, 'vidSize': 365070, 'totalSize': 507077},
          imgCount: 56,
          vidCount: 6),
      Album(
          id: 4,
          title: '90\'s',
          titleColor: Colors.white,
          latestUpdate: '4/5/2018',
          sizes: {'imgSize': 1200044, 'vidSize': 0, 'totalSize': 1200044},
          imgCount: 242,
          vidCount: 0),
    ];

    //Sort based on Sizes
    albums
        .sort((a, b) => a.sizes!['totalSize'].compareTo(b.sizes!['totalSize']));
    int FullStorageOfDrive = 5000000;

    //REM: to calc free space out of it as FullStorage is 5gb === 5,000,000
    //

    on<ColorsGroupedByFolders>((event, emit) {
      print("colors changed");
      List<StorageTile> listTiles = [];
      for (var album in albums) {
        //size means flex number
        //REM: first one on the list is the smaller
        print('index of ${albums.indexOf(album)}');
        int containerSize =
            (album.sizes!['totalSize'] / FullStorageOfDrive) * 1000;
        listTiles
            .add(StorageTile(album.title!, album.titleColor, containerSize));
      }
      emit(listTiles);
    });

    on<ColorsGroupedByFileType>((event, emit) {
      print("colors resetted");
      // emit([Colors.grey, Colors.black, Colors.blue]);
    });
  }
}

class StorageTile {
  Color color;
  int containerSize;
  String title;

  StorageTile(this.title, this.color, this.containerSize);
}
