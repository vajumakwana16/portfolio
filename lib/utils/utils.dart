import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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

  //build page title
  static buildPageTitle(BuildContext context, String title) => SizedBox(
      height: Get.height * 0.1,
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(Get.width * 0.01),
        child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      )));

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

  //launch url
  static Future<void> launchWebUrl(url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      print(e.toString());
    }
  }

  //send email
  static sendEmail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'vajumakwana16@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );

    launchUrl(emailLaunchUri);
  }
}
