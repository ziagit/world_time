import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/pages/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.orange[900]));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        leading: IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children:
                services.map((service) => serviceTemplate(service)).toList(),
          ),
        ),
      ),
    );
  }

  Widget serviceTemplate(service) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: {
          'icon': service.icon,
          'name': service.name,
          'details': service.details
        });
      },
      child: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
                width: 100.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(image: AssetImage('assets/${service.icon}.png')),
                ),
              ),
              Column(
                children: [
                  Text(
                    service.name,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 130.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: Text(
                        service.summary,
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
