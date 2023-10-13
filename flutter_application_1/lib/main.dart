import 'package:flutter/material.dart';
import 'Activity/Loading.dart';
import 'Activity/Location.dart';
import 'Activity/home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading": (context) => Loading(),
    },
  ));
}
