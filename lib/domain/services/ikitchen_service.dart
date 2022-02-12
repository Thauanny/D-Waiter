import '../entities/order.dart';

abstract class IKitchenService {
  Future<void> init();

  Future<void> dispose();

  void send(Order order);

  Stream<Order> getOrdersReady();
}
