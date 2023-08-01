import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/api_controller.dart';

class ApiView extends GetView<ApiController> {
  const ApiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ApiController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('ApiView'),
          centerTitle: true,
        ),
        body: Obx(
          () =>controller.data.length!=null? Container(
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.data[index].products[index].title),
                  );
                }),
          ):Center(child: CircularProgressIndicator(color: Colors.black,)),
        ));
  }
}
