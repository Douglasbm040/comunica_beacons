import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunica_beacons/src/core/bluetooth/ble_interation.dart';
import '../ui/comunication_ui.dart';

class ComunicationPage extends StatelessWidget {
  const ComunicationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<BleIntegration>(
        builder: (context, integration, child) => ComunicationUI(
              comunica: integration,
            ));
  }
}
