import 'package:ble_scanner/constants/textStyleConstants.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Bluetooth devices are scanning.\nPlease wait...",
              textAlign: TextAlign.center,
              style: appbarTitleStyle.copyWith(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
