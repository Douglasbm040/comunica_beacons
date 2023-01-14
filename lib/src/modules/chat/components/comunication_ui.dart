import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../../bluetoothble/services/interationble_service.dart';
import '../../../shared/models/ble_device.dart';

class ComunicationUI extends StatefulWidget {
  const ComunicationUI({
    Key? key,
    required this.comunication,
  }) : super(key: key);

  final IntegrationBleService comunication;

  @override
  State<ComunicationUI> createState() => _ComunicationUIState();
}

class _ComunicationUIState extends State<ComunicationUI> {
  final Uuid _myServiceUuid = //! adicionar automaticamente caracterista do ble
      Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
  final Uuid _myCharacteristicUuid =
      Uuid.parse("beb5483e-36e1-4688-b7f5-ea07361b26a8");
  List<int>? datareceive;
  @override
  Widget build(BuildContext context) {
    final deviceconected =
        ModalRoute.of(context)!.settings.arguments as BleDevice;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await widget.comunication.requestMtu(deviceconected.id, 100);
          await widget.comunication.writeCharacterisiticWithoutResponse(
              QualifiedCharacteristic(
                  characteristicId: _myCharacteristicUuid,
                  serviceId: _myServiceUuid,
                  deviceId: deviceconected.id),
              utf8.encode(
                  "olaa mundojhskjhfjklshdkfksdhgjkfgsfjksjkdfgkahgskhfasdfgahsjfgjkasgdjkfgjkasgfjkagjksdgfkashdfjagsjdfagsjdhgfjkasdfgjkasjfgjasgfjgasjkgfj"));
        },
        child: const Icon(Icons.send),
      ),
      appBar: AppBar(
          title: ListTile(
        textColor: Colors.white,
        title: Text(deviceconected.name),
        subtitle: Text(deviceconected.id),
        trailing: Text("rssi ${deviceconected.rssi}"),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return datareceive != null
                    ? Text(utf8.decode(datareceive!))
                    : const Text("STREAM NOT INIT");
              },
            ),
            ElevatedButton(
              onPressed: datareceive != null
                  ? null
                  : () async {
                      datareceive = await widget.comunication
                          .readCharacteristic(QualifiedCharacteristic(
                              characteristicId: _myCharacteristicUuid,
                              serviceId: _myServiceUuid,
                              deviceId: deviceconected.id));
                      setState(() {
                        datareceive;
                      });
                    },
              child: const Text("receber dados"),
            )
          ],
        ),
      ),
    );
  }
}
