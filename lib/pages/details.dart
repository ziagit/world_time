import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:world_time/pages/shared/custom_icons_icons.dart';
import 'dart:ui' as ui;

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF8FAF8),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.orange[800],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(image: AssetImage("assets/${data['icon']}.png")),
                ),
                Text(
                  data['name'],
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                  textDirection: ui.TextDirection.rtl,
                ),
                Text(
                  data['details'],
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  textDirection: ui.TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                backgroundColor: Colors.green[500],
                heroTag: 'btn1',
                onPressed: () {
                  whatsapp(context);
                },
                child: Icon(CustomIcons.whatsapp),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SpeedDial(
              heroTag: 'btn2',
              curve: Curves.easeInOutExpo,
              animatedIcon: AnimatedIcons.menu_close,
              overlayColor: Colors.black87,
              backgroundColor: Colors.green,
              foregroundColor: Colors.amber,
              animatedIconTheme: IconThemeData(color: Colors.white),
              children: [
                SpeedDialChild(
                  child: Icon(Icons.call),
                  backgroundColor: Colors.redAccent,
                  label: "0793896525",
                  onTap: () => roshan(),
                ),
                SpeedDialChild(
                  child: Icon(Icons.call),
                  backgroundColor: Colors.lightGreen,
                  label: "0748021594",
                  onTap: () => salaam(),
                ),
                SpeedDialChild(
                  child: Icon(Icons.call),
                  backgroundColor: Colors.orange,
                  label: "0765673610",
                  onTap: () => mtn(),
                ),
                SpeedDialChild(
                  child: Icon(Icons.call),
                  backgroundColor: Colors.blue[400],
                  label: "0728983459",
                  onTap: () => awc(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  roshan() {
    String phone = "tel:0793896525";
    launch(phone);
  }

  mtn() {
    String phone = "tel:0765673610";
    launch(phone);
  }

  salaam() {
    String phone = "tel:0748021594";
    launch(phone);
  }

  awc() {
    String phone = "tel:0728983459";
    launch(phone);
  }

  whatsapp(context) async {
    String phone = "+93749386584";
    String sms = "Hello there,";
    String url = "whatsapp://send?phone=$phone&text=$sms";
    await canLaunch(url) ? launch(url) : _showDialog();
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        shape:
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)));
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'واتس اب یاف نشد!.',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                  textDirection: ui.TextDirection.rtl,
                ),
                SizedBox(height: 20.0),
                Text(
                  'اگر میخواهید ازطریق وتس اب زنگ بزنید لطفا انستال کنید.',
                  style: TextStyle(fontSize: 11.0, color: Colors.grey[600]),
                  textDirection: ui.TextDirection.rtl,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('بستن'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
