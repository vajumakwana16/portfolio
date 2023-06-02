import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildSocialIcon(context, FontAwesomeIcons.linkedin, ""),
            buildSocialIcon(context, FontAwesomeIcons.instagram, ""),
            buildSocialIcon(context, FontAwesomeIcons.facebook, ""),
            buildSocialIcon(context, FontAwesomeIcons.twitter, ""),
          ],
        ));
  }

  buildSocialIcon(context, icon, link) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
            icon: FaIcon(icon,
                size: Get.width * 0.02, color: Theme.of(context).primaryColor),
            onPressed: () {}),
      );
}
