import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Utils.buildPageTitle(context, "Experience"),
      Container(
        height: Get.height,
      )
    ]);
  }
}
