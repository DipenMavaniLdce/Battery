import 'package:flutter/cupertino.dart';

class BatteryPersantage extends StatelessWidget {
  const BatteryPersantage({
    Key key,
    @required this.battery,
  }) : super(key: key);

  final int battery;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$battery%',
      style: TextStyle(fontSize: 70),
    );
  }
}

