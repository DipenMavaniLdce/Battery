import 'dart:async';
import 'dart:math';
import 'package:Bettry/app/model/battery_information.dart';
import 'package:battery/battery.dart';

class DeviceInformationService {
  bool _broadcastBattery = false;
  Battery _battery = Battery();

  StreamController<BatteryInformation> _batteryLevelController =
      StreamController<BatteryInformation>();

  Stream<BatteryInformation> get batteryLevel {
    _broadcastBatteryLevel();
    return _batteryLevelController.stream;
  }

  Future _broadcastBatteryLevel() async {
    _broadcastBattery = true;
    while (_broadcastBattery) {
      var batteryLevel = Random().nextInt(100); //await _battery.batteryLevel;
      _batteryLevelController
          .add(BatteryInformation(batteryLevel: batteryLevel));
      await Future.delayed(Duration(seconds: 5));
    }
  }

  void stopBroadcast() {
    _broadcastBattery = false;
  }
}
