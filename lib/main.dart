import 'package:comunica_beacons/src/controllers/controller_interationble.dart';
import 'package:comunica_beacons/src/controllers/controller_conectble.dart';
import 'package:comunica_beacons/src/controllers/controller_scannerble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ControllerScannerBle>(
        create: (context) => ControllerScannerBle(ble: _ble)),
    ChangeNotifierProvider<ControllerConnectorBle>(
        create: ((context) => ControllerConnectorBle(ble: _ble))),
    ChangeNotifierProvider(
        create: (context) => ControllerIntegrationBle(
            bleDiscoverServices: _ble.discoverServices,
            readcharacteristic: _ble.readCharacteristic))
  ], child: const App()));
}
