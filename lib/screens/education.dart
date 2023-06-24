import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                child: StepperListView(
                  shrinkWrap: true,
                  showStepperInLast: true,
                  stepperData: educationData,
                  stepAvatar: (_, data) {
                    final stepData = data as StepperItemData;
                    return PreferredSize(
                      preferredSize: Size.fromRadius(isMobile ? 20 : 40),
                      child: CircleAvatar(
                        radius: isMobile ? 20 : 40,
                        backgroundImage: AssetImage(
                          stepData.avatar!,
                        ),
                      ),
                    );
                  },
                  stepContentWidget: (_, data) {
                    final stepData = data as StepperItemData;
                    return Container(
                      margin: EdgeInsets.only(top: isMobile ? 1 : 20),
                      padding: EdgeInsets.all(isMobile ? 5 : 15),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(7),
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        title: Text(stepData.content['name'] ?? ''),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            //duration
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 20),
                                Text(
                                  stepData.content['duration'] ?? '',
                                  style: TextStyle(color: theme.primaryColor),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //occupation
                            Row(
                              children: [
                                Icon(Icons.school,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 20),
                                Text(stepData.content['occupation'] ?? ''),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //website
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.link,
                                      color: Theme.of(context).primaryColor),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      /* _launchURL(stepData.content['contact_list']
                                            ['Portfolio']);*/
                                    },
                                    child: InkWell(
                                      onTap: () => Utils.launchWebUrl(stepData
                                          .content['contact_list']['website']),
                                      child: Text(
                                        stepData.content['contact_list']
                                                ['website'] ??
                                            '',
                                        maxLines: 2,
                                        style:
                                            theme.textTheme.caption?.copyWith(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: 20),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: theme.dividerColor,
                            width: 0.8,
                          ),
                        ),
                      ),
                    );
                  },
                  stepperThemeData: StepperThemeData(
                    lineColor: theme.primaryColor,
                    lineWidth: 10,
                  ),
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
