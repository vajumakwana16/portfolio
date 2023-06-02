import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: Colors.cyan,
    );
  }
}
