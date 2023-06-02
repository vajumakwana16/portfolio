import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_widgets/neon_widgets.dart';

import 'constants.dart';

enum DeviceType { isTablet, isMobile, isWeb }

class Utils {
  //device type (isMobile , isTab ,isWeb)
  static getDevice(BuildContext context) {
    if (MediaQuery.of(context).size.width < 800) {
      return DeviceType.isMobile;
    } else if (MediaQuery.of(context).size.width > 1200) {
      return DeviceType.isTablet;
    } else if (MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1400) {
      return DeviceType.isWeb;
    }
  }

  //space
  static addVerticalSpace(height) => SizedBox(height: height);
  static addHriSpace(width) => SizedBox(width: width);

  //progressbar
  static lineProgressBar(progress) => NeonLine(
        lineWidth: Get.width * progress,
        lineHeight: 1,
        lightSpreadRadius: 10,
        spreadColor: Colors.white,
        lineColor: primaryColor,
      );
}
