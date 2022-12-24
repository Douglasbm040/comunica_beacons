import 'package:comunica_beacons/src/model/Ble_device.dart';
import 'package:flutter/material.dart';

class ComunicationPage extends StatelessWidget {
  const ComunicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceconected =
        ModalRoute.of(context)!.settings.arguments as BleDevice;
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [Text(deviceconected.name), Text(deviceconected.id)],
          ),
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Text("A");
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("receber dados"),
            )
          ],
        ));
  }
}
