import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/expirience_data.dart';
import '../utils/utils.dart';
import '../widgets/step_view_widget.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Utils.buildPageTitle(context, "Experience"),
            Center(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.01),
                child: StepWidget(stepDataList: experienceData),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
