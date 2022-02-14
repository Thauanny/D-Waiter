import 'dart:async';
import 'dart:io';

import 'package:d_waiter/domain/entities/order.dart';
import 'package:d_waiter/domain/services/ikitchen_service.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

class KitchenService implements IKitchenService {
  final NearbyService _nearbyService = NearbyService();
  final List<Device> _connectedDevices = List.empty(growable: true);
  late StreamSubscription _subscription;
  late StreamSubscription _receivedDataSubscription;
  final StreamController<Order> _ordersSubscription = StreamController();

  @override
  Future<void> init() async {
    await _nearbyService.init(
        serviceType: 'orders',
        deviceName: 'table 1',
        strategy: Strategy.P2P_CLUSTER,
        callback: (isRunning) async {
          if (isRunning) {
            await _nearbyService.stopBrowsingForPeers();
            await Future.delayed(const Duration(microseconds: 200));
            await _nearbyService.startBrowsingForPeers();
          }
        });

    _subscription =
        _nearbyService.stateChangedSubscription(callback: (devicesList) {
      for (Device element in devicesList) {
        if (Platform.isAndroid) {
          if (element.state == SessionState.connected) {
            _nearbyService.stopBrowsingForPeers();
          } else {
            _nearbyService.startBrowsingForPeers();
          }
        }
      }

      _connectedDevices.clear();
      _connectedDevices.addAll(
          devicesList.where((d) => d.state == SessionState.connected).toList());
    });

    _receivedDataSubscription =
        _nearbyService.dataReceivedSubscription(callback: (data) {
      _ordersSubscription.add(Order.fromMap(data));
    });
  }

  @override
  Stream<Order> getOrdersReady() {
    return _ordersSubscription.stream;
  }

  @override
  void send(Order order) {
    if (_connectedDevices.isNotEmpty &&
        _connectedDevices.first.state == SessionState.connected) {
      _nearbyService.sendMessage(
        _connectedDevices.first.deviceId,
        order.toJson(),
      );
    }
  }

  @override
  Future<void> dispose() async {
    _subscription.cancel();
    _receivedDataSubscription.cancel();
    _ordersSubscription.close();
  }
}
