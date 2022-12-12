import 'dart:io';

import 'package:comunica_beacons/model/itens_conectados.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                devices[deviceindex] = device;
              } else {
                devices.add(device);
              }
            
            }, onError: (Object e) {
              print(e);
            });
          },
          child: const Icon(Icons.search)),

      appBar: AppBar(
        title: Text("beacons comunication"),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return itens_conectados(
            devicename: devices[index].name,
            id: devices[index].id,
            ontap: () {
              print(devices[index].id);
            },
            //serviceUuids: devices[index].serviceUuids[0].toString(),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
