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

    return SizedBox(
      child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isMobile ? 1 : 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            SizedBox(
              height: isMobile ? Get.height * 0.1 : Get.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.addVerticalSpace(Get.height * 0.05),
                  const IntroTexts(),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntroPhotoView(
                      spreadValue: 10.0,
                      width:
                          Utils.getDevice(Get.context!) == DeviceType.isMobile
                              ? Get.width * 0.3
                              : Get.width * 0.25,
                      url: ""),
                ],
              ),
            ),
          ]),
    );
  }
}
