import 'package:ble_scanner/constants/textStyleConstants.dart';
import 'package:ble_scanner/models/bluetoothDeviceModel.dart';
import 'package:ble_scanner/widgets/connectionButtonWidget.dart';
import 'package:flutter/material.dart';

class BluetoothCard extends StatelessWidget {
  const BluetoothCard({Key key, @required this.blDevice, @required this.index})
      : super(key: key);

  final BluetoothDeviceModel blDevice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Text(
            blDevice.name,
            style: bluetoothDeviceNameStyle,
          ),
          Text(
            blDevice.id.toString(),
            style: bluetoothDeviceInfoStyle,
          ),
          const SizedBox(height: 30),
          ConnectionButton(
              blDevice: blDevice,
              index: index,
              width: MediaQuery.of(context).size.width * 0.3),
        ],
      ),
    );
  }
}
