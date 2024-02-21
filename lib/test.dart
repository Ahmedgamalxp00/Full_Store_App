import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/test_controller.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (controller.requestState == RequestState.loading) {
            return const Text('loading..............');
          } else if (controller.requestState == RequestState.success) {
            return Center(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Center(child: Text("${controller.myUsers[index]}"));
                },
              ),
            );
          } else {
            return Center(child: Text(controller.requestError));
          }
        },
      ),
    );
  }
}
