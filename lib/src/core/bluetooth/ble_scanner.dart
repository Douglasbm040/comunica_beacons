import 'dart:async';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import 'Ble_state.dart';

class BleScanner /*implements ReactiveState<BleScannerState>*/ {
  BleScanner({required FlutterReactiveBle ble}) : _ble = ble;

  final FlutterReactiveBle _ble;
/*
  final StreamController<BleScannerState> _stateStreamController =
      StreamController();*/

  final devices = <DiscoveredDevice>[];

  /*@override
  Stream<BleScannerState> get state => _stateStreamController.stream;*/
  getsevices() {
    return devices;
  }

  Stream<DiscoveredDevice>? scannear() {
    print("inicio");
    _ble.scanForDevices(withServices: [], scanMode: ScanMode.lowLatency).listen(
        (device) {
      final deviceindex = devices.indexWhere((d) => d.id == device.id);
      print("meio");
      //print('device ' + device.name);
      if (deviceindex >= 0) {
        devices[deviceindex] = device;
        print("meio 2");
      } else {
        devices.add(device);
        print("meio 3");
      }
    }, onError: (Object e) {
      print(e);
    });
    print(devices);
  }
/*
  void startScan() {
    print('Start ble discovery');
    devices.clear();
    _subscription?.cancel();
    _subscription = _ble.scanForDevices(withServices: []).listen((device) {
      final knownDeviceIndex = devices.indexWhere((d) => d.id == device.id);
      if (knownDeviceIndex >= 0) {
        devices[knownDeviceIndex] = device;
      } else {
        devices.add(device);
      }
      _pushState();
    }, onError: (Object e) => print('Device scan fails with error: $e'));
    _pushState();
  }

  void _pushState() {
    _stateStreamController.add(
      BleScannerState(
        discoveredDevices: devices,
        scanIsInProgress: _subscription != null,
      ),
    );
  }

  Future<void> stopScan() async {
    print('Stop ble discovery');

    await _subscription?.cancel();
    _subscription = null;
    _pushState();
  }

  Future<void> dispose() async {
    await _stateStreamController.close();
  }

  StreamSubscription? _subscription;
}

class BleScannerState {
  const BleScannerState({
    required this.discoveredDevices,
    required this.scanIsInProgress,
  });

  final List<DiscoveredDevice> discoveredDevices;
  final bool scanIsInProgress;*/
}
