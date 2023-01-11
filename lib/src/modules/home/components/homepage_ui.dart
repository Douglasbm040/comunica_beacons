import 'package:comunica_beacons/src/modules/bluetoothble/services/conectble_service.dart';
import 'package:comunica_beacons/src/modules/bluetoothble/services/scannerble_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import '../../../shared/models/ble_device.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({
    Key? key,
    required this.devices,
    required this.plug,
  }) : super(key: key);

  final List<DiscoveredDevice> devices;
  final ConnectorBleService plug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              label: "sim",
              icon: Icon(Icons.abc),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              label: "NAO",
              icon: Icon(Icons.abc_outlined),
              backgroundColor: Colors.red)
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<ScannerBleService>(context, listen: false)
                  .scanner();
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
