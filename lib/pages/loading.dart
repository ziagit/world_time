import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getCards() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/services');
    });
  }

  @override
  void initState() {
    super.initState();
    getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[900],
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
