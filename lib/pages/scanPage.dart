import 'package:ble_scanner/pages/detailPage.dart';
import 'package:ble_scanner/providers/appState.dart';
import 'package:ble_scanner/widgets/appbarWidget.dart';
import 'package:ble_scanner/widgets/bluetoothCardWidget.dart';
import 'package:ble_scanner/widgets/loadingWidget.dart';
import 'package:ble_scanner/widgets/scanButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  FlutterBlue bluetooth = FlutterBlue.instance;
  var isScanning = false;
  @override
  void initState() {
    scanDevices();
    super.initState();
  }

  scanDevices() async {
    setState(() => isScanning = true);
    await bluetooth.startScan(timeout: Duration(seconds: 5));
    bluetooth.scanResults.listen((event) async {
      await Provider.of<AppState>(context, listen: false)
          .setBluetoothDevices(event);
    });
    await bluetooth.stopScan();
    setState(() => isScanning = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "BLE Scanner"),
        body: isScanning
            ? LoadingWidget()
            : Consumer<AppState>(
                builder: (context, appstate, child) => Column(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemCount: appstate.blDevices.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DeviceInfoPage(
                                    index: index,
                                    blDevice: appstate.blDevices[index],
                                  ),
                                ));
                              },
                              child: BluetoothCard(
                                blDevice: appstate.blDevices[index],
                                index: index,
                              ),
                            ),
                          )),
                    ),
                    ScanButtonWidget(onPressed: scanDevices)
                  ],
                ),
              ));
  }
}
