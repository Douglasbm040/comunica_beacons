import 'package:comunica_beacons/src/modules/bluetoothble/services/interationble_service.dart';
import 'package:comunica_beacons/src/modules/bluetoothble/services/conectble_service.dart';
import 'package:comunica_beacons/src/modules/bluetoothble/services/scannerble_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ScannerBleService>(
        create: (context) => ScannerBleService(ble: _ble)),
    ChangeNotifierProvider<ConnectorBleService>(
        create: ((context) => ConnectorBleService(ble: _ble))),
    ChangeNotifierProvider(
        create: (context) => IntegrationBleService(
            writeWithoutResponse: _ble.writeCharacteristicWithoutResponse,
            bleDiscoverServices: _ble.discoverServices,
            readcharacteristic: _ble.readCharacteristic))
  ], child: const App()));
}
