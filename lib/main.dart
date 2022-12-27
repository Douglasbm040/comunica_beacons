// ignore_for_file: unused_import

import 'package:comunica_beacons/src/core/bluetooth/ble_interation.dart';
import 'package:comunica_beacons/src/core/bluetooth/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'src/core/bluetooth/ble_conect.dart';
import 'src/core/bluetooth/ble_scanner.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Scan>(create: (context) => Scan(ble: _ble)),
    ChangeNotifierProvider<BleConnector>(
        create: ((context) => BleConnector(ble: _ble))),
    ChangeNotifierProvider(
        create: (context) => BleIntegration(
            bleDiscoverServices: _ble.discoverServices,
            readcharacteristic: _ble.readCharacteristic))
  ], child: const App()));
}
