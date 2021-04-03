import 'package:ble_scanner/models/bluetoothDeviceModel.dart';
import 'package:ble_scanner/widgets/appbarWidget.dart';
import 'package:ble_scanner/widgets/connectionButtonWidget.dart';
import 'package:ble_scanner/widgets/infoTextWidget.dart';
import 'package:flutter/material.dart';

class DeviceInfoPage extends StatelessWidget {
  final BluetoothDeviceModel blDevice;
  final int index;

  const DeviceInfoPage({Key key, @required this.blDevice, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var connectableString =
        blDevice.connectable ? "connectable" : "not connectable";
    return Scaffold(
      appBar: AppBarWidget(title: blDevice.name),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoText(text: "Device Name:\n${blDevice.name}"),
              const SizedBox(height: 10),
              InfoText(text: "Device ID:\n${blDevice.id}"),
              const SizedBox(height: 10),
              InfoText(text: "This device is $connectableString"),
              const SizedBox(height: 30),
              ConnectionButton(
                  blDevice: blDevice,
                  index: index,
                  width: MediaQuery.of(context).size.width * 0.8)
            ],
          ),
        ),
      ),
    );
  }
}
