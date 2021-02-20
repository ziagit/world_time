import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "کارگر",
              style: TextStyle(
                  color: Colors.orange[800], fontWeight: FontWeight.bold),
            ),
          ],
        ),
        //centerTitle: true,
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
            padding: const EdgeInsets.fromLTRB(22.0, 12.0, 22.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "افزایش کار و مشغله های زندگی امروز، وقت زیادی از ما گرفته و میگیرند و روز به روز رو به افزایش می باشد. و این باعث کمبود وقت شده و ما را از انجام اکثر کارهای مهم زندگی باز می دارد. کارگر برای مرفع ساختن این نیازمندی ها ایجاد شد، تا هموطنان ما در هیچ شرایط، فرصتی را از دست نداده و همچنان از انجام آن کار های مهم و ضروری غافل نشوند. با استفاده از این اپلیکشن شما می توانید به راحتی و آسانی با افراد مسکلی و با تجربه در ارتباط بوده و از تجربه و مسلک شان استفاده نمائید.",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  textDirection: ui.TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
