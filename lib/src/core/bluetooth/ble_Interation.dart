import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleIntegration {
  final Future<List<DiscoveredService>> Function(String deviceId)
      _bleDiscoverServices;
  final Future<List<int>> Function(QualifiedCharacteristic characteristic)
      _readcharacteristic;

  BleIntegration(
      {required Future<List<DiscoveredService>> Function(String deviceId)
          bleDiscoverServices,
      required Future<List<int>> Function(
              QualifiedCharacteristic characteristic)
          readcharacteristic})
      : _bleDiscoverServices = bleDiscoverServices,
        _readcharacteristic = readcharacteristic;

  Future<List<DiscoveredService>> discoverServices(String deviceId) async {
    try {
      print('Start discovering services for: $deviceId');
      final result = await _bleDiscoverServices(deviceId);
      print('Discovering services finished');
      return result;
    } on Exception catch (e) {
      print('Error occured when discovering services: $e');
      rethrow;
    }
  }

  Future<List<int>> readCharacteristic(
      QualifiedCharacteristic characteristic) async {
    try {
      final result = await _readcharacteristic(characteristic);

      print('Read ${characteristic.characteristicId}: value = $result');
      return result;
    } on Exception catch (e, s) {
      print(
        'Error occured when reading ${characteristic.characteristicId} : $e',
      );
      // ignore: avoid_print
      print(s);
      rethrow;
    }
  }
}
