import 'package:flutter/material.dart';

const Color mainColor = const Color(0xFF5F5F5F);
const Color appbarColor = const Color(0xFF89BBCB);

const LinearGradient connectGradient = const LinearGradient(
    colors: [Color(0xFF16BC80), appbarColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

const LinearGradient disconnectGradient = const LinearGradient(
    colors: [Color(0xFFF26464), mainColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

const LinearGradient ncableGradient = const LinearGradient(
    colors: [mainColor, appbarColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
