import 'package:Bettry/app/model/battery_information.dart';
import 'package:Bettry/app/services/device_information_service.dart';
import 'package:Bettry/app/ui/battery_color_widget.dart';
import 'package:Bettry/app/ui/battery_persantage.dart';
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:Bettry/app/constant/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Body()),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Color> myColor = [
    Color(0xFF77EED8),
    Color(0xFF9EABE4),
  ];
  BatteryInformation bt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryValue();
    
  }

  getBatteryValue() async {
    var battery = await Battery().batteryLevel;
    setState(() {
      bt = BatteryInformation(batteryLevel: battery);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: DeviceInformationService().batteryLevel,
        initialData: bt,
        builder: (context, snapshot) {
          var battery = snapshot.data.batteryLevel;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BatteryPersantage(battery: battery),
                BatteryColorWidget(
                  size: size,
                  myColor: getBatteryColor(
                    BatteryInformation(batteryLevel: battery),
                  ),
                  batteryLavel: battery,
                ),
              ],
            ),
          );
        });
  }
}

