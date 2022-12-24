import 'package:flutter/material.dart'; /*
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'src/core/bluetooth/ble_Interation.dart';
import 'src/core/bluetooth/ble_conect.dart';
import 'src/core/bluetooth/ble_scanner.dart';*/
import 'app.dart';

void main() {
  /*final FlutterReactiveBle _ble = FlutterReactiveBle();
  final BleConnector _conector = BleConnector(ble: _ble);
  final BleScanner _scanner = BleScanner(ble: _ble);
  final _interation = BleIntegration(
      bleDiscoverServices: _ble.discoverServices,
      readcharacteristic: _ble.readCharacteristic);*/
  runApp(
      /*MultiProvider(providers: [
    Provider.value(value: _interation),
    Provider.value(value: _conector),
    Provider.value(value: _scanner)
  ], child:*/
      const App() /*)*/);
}
