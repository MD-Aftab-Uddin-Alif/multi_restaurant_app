import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'more_controller.dart';

class MorePage extends GetView<MoreController> {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MorePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MorePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
