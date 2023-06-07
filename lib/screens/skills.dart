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
      // height: Get.height,
      color: Colors.black,
      child: const SkillItems(),
    );
  }
}

class SkillItems extends StatelessWidget {
  const SkillItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return Wrap(children: [
      Center(
          child:
              Text("Skills", style: Theme.of(context).textTheme.headlineLarge)),
      GridView.count(
          shrinkWrap: true,
          crossAxisCount: isMobile ? 3 : 5,
          crossAxisSpacing: Get.width * 0.02,
          mainAxisSpacing: Get.width * 0.02,
          padding: const EdgeInsets.all(5),
          children: technologiesList.map((e) => buildSkillItem(e)).toList()),
    ]);
  }

  Widget buildSkillItem(Skill skill) => SizedBox(
        width: Get.width * 0.3,
        height: Get.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            width: Utils.getDevice(Get.context!) ==
                                    DeviceType.isMobile
                                ? Get.width * 0.2
                                : Get.width * 0.1,
                            height: Utils.getDevice(Get.context!) ==
                                    DeviceType.isMobile
                                ? Get.width * 0.2
                                : Get.width * 0.1,
                            child: CircularProgressIndicator(
                              strokeWidth: 10,
                              value: skill.progress / 100,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                        Center(
                            child: SizedBox(
                                width: Get.width * 0.18,
                                height: Get.width * 0.18,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: Get.width * 0.05,
                                        width: Get.width * 0.05,
                                        child: skill.logo),
                                    Text(skill.name),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Text("${skill.progress} %"),
                // ),
              ],
            )
          ],
        ),
      );
}
