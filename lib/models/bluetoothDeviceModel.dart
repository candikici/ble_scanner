import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDeviceModel {
  String name;
  DeviceIdentifier id;
  bool connectable;
  bool isConnected;
  BluetoothDeviceModel({
    @required this.name,
    @required this.id,
    @required this.connectable,
    @required this.isConnected,
  });

  BluetoothDeviceModel copyWith({
    String name,
    DeviceIdentifier id,
    bool connectable,
    bool isConnected,
  }) {
    return BluetoothDeviceModel(
      name: name ?? this.name,
      id: id ?? this.id,
      connectable: connectable ?? this.connectable,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'connectable': connectable,
      'isConnected': isConnected,
    };
  }

  factory BluetoothDeviceModel.fromMap(Map<String, dynamic> map) {
    return BluetoothDeviceModel(
      name: map['name'],
      id: map['id'],
      connectable: map['connectable'],
      isConnected: map['isConnected'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BluetoothDeviceModel.fromJson(String source) =>
      BluetoothDeviceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BluetoothDeviceModel(name: $name, id: $id, connectable: $connectable, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BluetoothDeviceModel &&
        other.name == name &&
        other.id == id &&
        other.connectable == connectable &&
        other.isConnected == isConnected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        connectable.hashCode ^
        isConnected.hashCode;
  }
}
