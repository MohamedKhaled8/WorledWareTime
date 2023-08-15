import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AllCountries {
  final String flag;
  final String countryName;
  final String link;

  AllCountries(
      {required this.countryName, required this.flag, required this.link});
  late bool status;
  late String timeNow;
  late String timeZone;
  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
      Map receivedData = jsonDecode(response.body);
      DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
      int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
      DateTime realtime = datetime.add(Duration(hours: offset));

      if (realtime.hour > 5 && realtime.hour < 18) {
        status = true;
      } else {
        status = false;
      }

      timeNow = (DateFormat('hh:mm a')).format(realtime);

      timeZone = receivedData["timezone"];
    } catch (e) {
      ScaffoldMessenger(
          child: Container(
        color: Colors.grey[600],
        height: 90,
        width: 150,
        child: Center(
          child: Text(e.toString()),
        ),
      ));
    }
  }
}
