import 'package:ble_scanner/constants/colorContants.dart';
import 'package:ble_scanner/constants/textStyleConstants.dart';
import 'package:ble_scanner/models/bluetoothDeviceModel.dart';
import 'package:ble_scanner/providers/appState.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ConnectionButton extends StatelessWidget {
  const ConnectionButton({
    Key key,
    @required this.blDevice,
    @required this.width,
    @required this.index,
  }) : super(key: key);

  final BluetoothDeviceModel blDevice;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appstate, child) => StatefulBuilder(
        builder: (context, setState) {
          bool connecting = false;
          return connecting
              ? CircularProgressIndicator()
              : TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () async {
                    setState(() => connecting = true);
                    await connectionEstablishing(appstate);
                    setState(() => connecting = false);
                  },
                  child: Ink(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        !appstate.blDevices[index].connectable
                            ? "Unavailable"
                            : appstate.blDevices[index].isConnected
                                ? "Disconnect"
                                : "Connect",
                        textAlign: TextAlign.center,
                        style: buttonTextStyle,
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: !appstate.blDevices[index].connectable
                            ? ncableGradient
                            : appstate.blDevices[index].isConnected
                                ? disconnectGradient
                                : connectGradient,
                        borderRadius: BorderRadius.circular(30)),
                  ));
        },
      ),
    );
  }

  Future connectionEstablishing(AppState appstate) async {
    if (!blDevice.connectable)
      Fluttertoast.showToast(msg: "This device is not connectable.");
    else {
      var index = appstate.bluetoothDevice
          .indexWhere((element) => element.device.id == blDevice.id);
      if (!blDevice.isConnected)
        try {
          await appstate.bluetoothDevice[index].device
              .connect()
              .catchError(() => Fluttertoast.showToast(msg: "Error"));

          await appstate.setSingleDevice(blDevice.copyWith(isConnected: true));
        } catch (e) {
          Fluttertoast.showToast(msg: "Connection could not established.");
        }
      else {
        try {
          await appstate.bluetoothDevice[index].device.disconnect();
          await appstate.setSingleDevice(blDevice.copyWith(isConnected: false));
        } catch (e) {
          Fluttertoast.showToast(msg: "Connection could not ended.");
        }
      }
    }
  }
}
