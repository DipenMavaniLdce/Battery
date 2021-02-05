import 'package:Bettry/app/model/battery_information.dart';
import 'package:flutter/cupertino.dart';

enum ChargingColor { green, blue, red }

Map<ChargingColor, List<Color>> chargingColorList = {
  ChargingColor.blue: [
    Color(0xFF77EED8),
    Color(0xFF9EABE4),
  ],
  ChargingColor.green: [
    Color(0xFF0BAB64),
    Color(0xFF3BB78F),
  ],
  ChargingColor.red: [
    Color(0xFFFC575E),
    Color(0xFFF7B42C),
  ]
};

List<Color> getBatteryColor(BatteryInformation bt) {
  if (bt.batteryLevel < 16) {
    return chargingColorList[ChargingColor.red];
  } else if (bt.batteryLevel > 15 && bt.batteryLevel < 61) {
    return chargingColorList[ChargingColor.blue];
  } else {
    return chargingColorList[ChargingColor.green];
  }
}
