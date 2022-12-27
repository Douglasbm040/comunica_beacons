import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunica_beacons/src/core/bluetooth/ble_conect.dart';
import 'package:comunica_beacons/src/core/bluetooth/scanner.dart';
import '../ui/list_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Scan, BleConnector>(
      builder: (context, Scanner, conector, __) => ListScreen(
        devices: Scanner.devices,
        plug: conector,
      ),
    );
  }
}
