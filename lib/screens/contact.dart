import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/social_icons.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.9,
        color: Colors.black,
        alignment: Alignment.center,
        child: const SocialIcons());
  }
}
