import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: Colors.black,
    );
  }
}
