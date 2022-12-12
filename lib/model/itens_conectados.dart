// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class itens_conectados extends StatelessWidget {
  final String devicename;
  final Function ontap;
  final String id;
  //final String serviceUuids;
  const itens_conectados({
    Key? key,
    //required this.serviceUuids,
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
            print("a");
            Navigator.of(context).pushNamed('/chat');
          },
        ));
  }
}
