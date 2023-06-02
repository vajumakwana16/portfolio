import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: Colors.red,
    );
  }
}
