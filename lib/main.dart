import 'package:flutter/material.dart';
import 'package:world_time/pages/about.dart';
import 'package:world_time/pages/details.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/services': (context) => Home(),
        '/details': (context) => Details(),
        '/about': (context) => About()
      },
    ));
