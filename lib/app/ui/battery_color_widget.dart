import 'dart:async';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';

class BatteryColorWidget extends StatefulWidget {
  const BatteryColorWidget({
    Key key,
    @required this.size,
    @required this.myColor,
    @required this.batteryLavel,
  }) : super(key: key);

  final Size size;
  final List<Color> myColor;
  final int batteryLavel;

  @override
  _BatteryColorWidgetState createState() => _BatteryColorWidgetState();
}

class _BatteryColorWidgetState extends State<BatteryColorWidget> {
  Battery _battery;
  List<Color> myColor;
  BatteryState bstate;
  List<FractionalOffset> topbottom = [
    FractionalOffset.bottomCenter,
    FractionalOffset.topCenter
  ];
  @override
  // ignore: must_call_super
  void initState() {
    setState(() {
      _battery = Battery();
      myColor = widget.myColor;
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      print(state.toString());
      if (state != BatteryState.charging) {
        Timer.periodic(new Duration(seconds: 3), (timer) {
          topbottom.insert(1, topbottom.removeAt(0));

          setState(() {
            bstate = state;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: widget.size.height * 0.50,
      width: widget.size.width * 0.50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.teal),
      ),
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 1000),
        height: widget.size.height * 0.50 * widget.batteryLavel / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: widget.myColor,
            begin: topbottom[0],
            end: topbottom[1],
          ),
        ),
      ),
    );
  }
}
