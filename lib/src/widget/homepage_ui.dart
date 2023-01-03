import 'package:comunica_beacons/src/controllers/controller_blescan.txt';
import 'package:comunica_beacons/src/controllers/controller_conectble.dart';
import 'package:comunica_beacons/src/controllers/controller_scannerble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import '../model/ble_device.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({
    Key? key,
    required this.devices,
    required this.plug,
  }) : super(key: key);

  final List<DiscoveredDevice> devices;
  final ControllerConnectorBle plug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<ControllerScannerBle>(context, listen: false)
                  .scannner();
            },
            child: const Icon(Icons.search)),
        appBar: AppBar(
          title: const Text("beacons comunication"),
        ),
        body: ListView(
          children: devices
              .map(
                (device) => ListTile(
                  title: Text(device.name),
                  subtitle: Text(device.id),
                  trailing: ElevatedButton(
                    onPressed: () {
                      plug.connect(device.id);
                      Navigator.of(context).pushNamed("/comunication",
                          arguments: BleDevice(
                              name: device.name,
                              id: device.id,
                              rssi: device.rssi));
                    },
                    child: const Text("conectar"),
                  ),
                  leading: Column(
                    children: [
                      const Text("rssi"),
                      Text(device.rssi.toString()),
                    ],
                  ),
                ),
              )
              .toList(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
