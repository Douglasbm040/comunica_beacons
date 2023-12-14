import 'dart:async';

import 'package:comunica_beacons/src/modules/database/firebase/interface/firebase_interface.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
enum StateRequisition { erro, correct, notrequest }

class FirebaseStoreRepository extends ChangeNotifier implements FirebaseInterface {
  Map _device = {};
  StateRequisition _state = StateRequisition.notrequest;
  final DatabaseReference _dataRef = FirebaseDatabase.instance.ref("Device");
  late StreamSubscription<DatabaseEvent> _dataSubscription;
  StateRequisition get state => _state;
  @override
  get device => _device;
  requisition() async {
    try {
      final _dataSnapshot = await _dataRef.get();
      _device = _dataSnapshot.value as Map;
      _state = StateRequisition.correct;
    } catch (e) {
      print(e.toString());
      _state = StateRequisition.erro;
    }
    _dataSubscription = _dataRef.onValue.listen((DatabaseEvent event) {
      _device = (event.snapshot.value ?? 0) as Map;
    });
  }

  void dispose() {
    _dataSubscription.cancel();
    super.dispose();
  }
}
