import 'package:flutter/material.dart';

enum DeviceType { isTablet, isMobile, isWeb }

class Utils {
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
}
