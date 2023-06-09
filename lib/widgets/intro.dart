import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/utils.dart';

import 'intro_photoview.dart';
import 'intro_text.dart';

class Intro extends StatelessWidget {
  final double spreadValue;
  const Intro({Key? key, required this.spreadValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        height: Get.height,
        child: isMobile
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: introWidgets(isMobile))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: introWidgets(isMobile)));
  }

  List<Widget> introWidgets(isMobile) {
    return [
      if (isMobile) SizedBox(height: Get.height * 0.1),
      SizedBox(
        height: Get.height * 0.2,
        child: const Center(child: IntroTexts()),
      ),
      SizedBox(
          height: isMobile ? Get.height * 0.7 : Get.height * 0.7,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            IntroPhotoView(
                spreadValue: 10.0,
                width: Utils.getDevice(Get.context!) == DeviceType.isMobile
                    ? Get.width * 0.7
                    : Get.width * 0.3,
                url: ""),
          ]))
    ];
  }
}
