import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/skills_data.dart';

import '../utils/utils.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      color: Colors.black,
      child: SkillItems(),
    );
  }
}

class SkillItems extends StatelessWidget {
  const SkillItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> contactItems = [
      // buildSkillItem( ""),
      // buildSkillItem(""),
      // buildSkillItem(""),
      // buildSkillItem(""),
    ];

    bool isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: isMobile ? 2 : 4,
        children: technologiesList.map((e) => buildSkillItem(e)).toList());
  }

  Widget buildSkillItem(Tech skill) => SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              SizedBox(
                  width: Get.width * 0.05,
                  height: Get.width * 0.05,
                  child: CircularProgressIndicator(value: skill.progress)),
              Text(skill.name),
              Text(skill.definition),
              Text("${skill.progress} %"),
            ])
          ],
        ),
      );
}
