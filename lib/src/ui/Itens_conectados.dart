// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../model/Ble_device.dart';

class ItensConectados extends StatelessWidget {
  final BleDevice object;
  final String devicename;
  final Function ontap;
  final String id;
  //final String serviceUuids;
  const ItensConectados({
    Key? key,
    //required this.serviceUuids,
    required this.object,
    required this.devicename,
    required this.ontap,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(devicename),
        subtitle: Text(id),
        //leading: Text(serviceUuids),
        trailing: ElevatedButton(
          child: const Text("conectar"),
          onPressed: () {
            ontap();
            print("iten clicado");
            Navigator.of(context).pushNamed('/chat', arguments: object);
          },
        ));
  }
}
