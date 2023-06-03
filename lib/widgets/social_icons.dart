import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/widgets/intro_photoview.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> contactItems = [
      buildSocialIcon(FontAwesomeIcons.linkedin, ""),
      buildSocialIcon(FontAwesomeIcons.instagram, ""),
      buildSocialIcon(FontAwesomeIcons.facebook, ""),
      buildSocialIcon(FontAwesomeIcons.twitter, ""),
    ];

    bool isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: isMobile ? 2 : 4,
        children: contactItems.map((e) => e).toList());
  }

  buildSocialIcon(icon, link) => SizedBox(
        height: Get.height * 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntroPhotoView(
                spreadValue: 10.0,
                width: Utils.getDevice(Get.context!) == DeviceType.isMobile
                    ? Get.width * 0.3
                    : Get.width * 0.1,
                url: ""),
            Utils.addVerticalSpace(Get.height * 0.02),
            IconButton(
                icon: FaIcon(icon,
                    size: Utils.getDevice(Get.context!) == DeviceType.isMobile
                        ? Get.width * 0.05
                        : Get.width * 0.03,
                    color: primaryColor),
                onPressed: () {}),
          ],
        ),
      );
}
