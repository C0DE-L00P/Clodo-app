import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';

class Album {
  int? id;
  final String? title;
  Color titleColor = Colors.white,subTitleColor = Colors.grey;

  String? img, latestUpdate,createdIn,createdBy,location;
  List<String>? usersHasAccess;

  int? imgCount, vidCount;

  Map? sizes = {'imgSize':2,'vidSize':3,'totalSize':5}; //Example

  Album({
    required this.id,
    required this.title,
    required this.titleColor,
    this.img,
    this.latestUpdate,
    this.imgCount,
    this.vidCount,
    this.sizes,
    this.createdIn,
    this.createdBy,
    this.location,
    this.usersHasAccess,
  });
}
