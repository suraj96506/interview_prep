import 'package:get/get.dart';

import '../modules/Api/bindings/api_binding.dart';
import '../modules/Api/views/api_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.API;

  static final routes = [
    GetPage(
      name: _Paths.API,
      page: () => const ApiView(),
      binding: ApiBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
