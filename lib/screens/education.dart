import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/widgets/step_view_widget.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../data/education_data.dart';
import '../utils/utils.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile =
        Utils.getDevice(context) == DeviceType.isMobile ? true : false;

    return SafeArea(
      child: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Utils.buildPageTitle(context, "Education"),
            Center(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.01),
                child: StepWidget(stepDataList: educationData),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
