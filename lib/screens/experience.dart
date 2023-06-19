import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Center(
          child: Text("Experience",
              style: Theme.of(context).textTheme.headlineLarge)),
      Container(
        height: Get.height,
      )
    ]);
  }
}
