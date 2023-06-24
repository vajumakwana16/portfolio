import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> contactItems = [
      buildSocialIcon(FontAwesomeIcons.github,
          "https://github.com/vajumakwana16?tab=repositories"),
      buildSocialIcon(FontAwesomeIcons.linkedin,
          "https://in.linkedin.com/in/vajumakwana16"),
      buildSocialIcon(
          FontAwesomeIcons.instagram, "https://www.instagram.com/vaju.makwana"),
      buildSocialIcon(FontAwesomeIcons.facebook,
          "https://www.facebook.com/vaju.makwana.33/"),
      buildSocialIcon(
          FontAwesomeIcons.twitter, "https://twitter.com/vajumakwana16"),
    ];

    bool isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return SizedBox(
        height: Get.height * 0.1,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            children: contactItems.map((e) => e).toList()));
  }

  buildSocialIcon(icon, url) => SizedBox(
        height: Get.width * 0.2,
        width: Get.width * 0.1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: InkWell(
              splashColor: Colors.cyan.shade100,
              hoverColor: Colors.white12,
              onTap: () async => await Utils.launchWebUrl(url),
              child: IconButton(
                  icon: FaIcon(icon, color: primaryColor),
                  onPressed: () async => await Utils.launchWebUrl(url)),
            ),
          ),
        ),
      );
}
