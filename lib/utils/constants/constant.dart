import 'package:event_bus/event_bus.dart';
import 'package:agora/export.dart';

final EventBus appEventBus = EventBus();

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();


class AppHttpError {
  AppHttpStatus status;
  String? message;

  AppHttpError({required this.status, required this.message});

  @override
  String toString() {
    return message ?? T.somethingUnexpectedWentWrong.r;
  }
}