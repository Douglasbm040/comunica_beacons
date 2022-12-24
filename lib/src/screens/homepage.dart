import 'dart:io';

import 'package:comunica_beacons/src/model/Ble_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../ui/Itens_conectados.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final flutterReactiveBle = FlutterReactiveBle();
  var subscription;
  final devices = <DiscoveredDevice>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print("0");
            subscription = flutterReactiveBle.scanForDevices(
                withServices: [],
                scanMode: ScanMode.lowLatency).listen((device) {
              final deviceindex = devices.indexWhere((d) => d.id == device.id);
              //print('device ' + device.name);
              if (deviceindex >= 0) {
                setState(() {
                  devices[deviceindex] = device;
                });
              } else {
                devices.add(device);
              }
            }, onError: (Object e) {
              print(e);
            });
          },
          child: const Icon(Icons.search)),

      appBar: AppBar(
        title: const Text("beacons comunication"),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItensConectados(
            devicename: devices[index].name,
            id: devices[index].id,
            ontap: () {
              print(devices[index].id);
            },
            object: BleDevice(name: devices[index].name, id: devices[index].id),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
