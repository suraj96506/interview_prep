import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview_prep/app/model.dart';

class ApiController extends GetxController {
  //TODO: Implement ApiController
  final _firebaseMessaging = FirebaseMessaging.instance;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    api();
    initNotification();
  }

  RxList<Datamodel> data = <Datamodel>[].obs;
  api() async {
    var response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );
    if (response.statusCode == 200) {
      var local = jsonDecode(response.body);
      for (var locals in local["products"]) {
        data.add(Datamodel.fromJson(local));
        print(data.length);
      }
    }
  }

  Future<void> handelbackgrounfmsg(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }

  Future initpushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.onBackgroundMessage(handelbackgrounfmsg);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("token:$fcmToken");
    FirebaseMessaging.onBackgroundMessage(handelbackgrounfmsg);
  }
}
