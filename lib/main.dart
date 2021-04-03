import 'package:ble_scanner/constants/colorContants.dart';
import 'package:ble_scanner/pages/scanPage.dart';
import 'package:ble_scanner/providers/appState.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (context) => AppState()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'BLE Scanner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryColor: mainColor,
          backgroundColor: mainColor,
          scaffoldBackgroundColor: mainColor,
        ),
        home: ScanPage(),
      ),
    );
  }
}
