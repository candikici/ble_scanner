import 'package:ble_scanner/constants/colorContants.dart';
import 'package:ble_scanner/constants/textStyleConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ScanButtonWidget extends StatelessWidget {
  const ScanButtonWidget({Key key, @required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: appbarColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(
              FeatherIcons.search,
              color: Colors.white,
            ),
            label: const Text(
              "Scan",
              style: appbarTitleStyle,
            )),
      ),
    );
  }
}
