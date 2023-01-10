import 'package:comunica_beacons/src/modules/bluetoothble/controllers/controller_conectble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunica_beacons/src/modules/bluetoothble/controllers/controller_scannerble.dart';
import '../components/homepage_ui.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ControllerScannerBle, ControllerConnectorBle>(
      builder: (context, Scanner, swicthconection, __) => HomePageUi(
        devices: Scanner.devices,
        plug: swicthconection,
      ),
    );
  }
}
