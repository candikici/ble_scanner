import 'package:ble_scanner/models/bluetoothDeviceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AppState with ChangeNotifier {
  List<BluetoothDeviceModel> blDevices = [];
  List<ScanResult> bluetoothDevice = [];
  FlutterBlue flutterBlue = FlutterBlue.instance;

  setBluetoothDevices(List<ScanResult> results) async {
    if (blDevices.length != 0) {
      blDevices.clear();
      bluetoothDevice.clear();
    }
    for (var r in results) {
      blDevices.add(BluetoothDeviceModel(
          name: r.device.name.length != 0 ? r.device.name : "n / a",
          id: r.device.id,
          connectable: r.advertisementData.connectable,
          isConnected: false));
      bluetoothDevice.add(r);
    }
    notifyListeners();
  }

  setSingleDevice(BluetoothDeviceModel updatedDevice) {
    var index =
        blDevices.indexWhere((element) => element.id == updatedDevice.id);

    blDevices[index] = updatedDevice;
    notifyListeners();
  }
}
