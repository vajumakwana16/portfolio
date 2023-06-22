import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/parallex.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../utils/utils.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final _stepperData = [
    StepperItemData(
      id: '0',
      content: ({
        'name': 'Government Polytechnic Jamnagar',
        'occupation': 'Computer Engineering',
        'Grade': '7.43 CGPA',
        "duration": 'Jan 2018 - Jan 2021',
        "contact_list": {
          "website": "http://www.gpjm.cteguj.in/",
        }
      }),
      avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
    ),
    StepperItemData(
      id: '1',
      content: ({
        'name': 'B H Gardi College of Engineering & Technology',
        'occupation': 'Computer Engineering',
        'Grade': '7.43 CGPA',
        "duration": 'Apr 2021 - Jan 2024',
        "contact_list": {
          "website": "https://www.gardividyapith.ac.in/",
        }
      }),
      avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(children: [
      Utils.buildPageTitle(context, "Education"),
      Padding(
        padding: EdgeInsets.all(Get.width * 0.1),
        child: StepperListView(
          shrinkWrap: true,
          showStepperInLast: true,
          stepperData: _stepperData,
          stepAvatar: (_, data) {
            final stepData = data as StepperItemData;
            return PreferredSize(
              preferredSize: const Size.fromRadius(40),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  stepData.avatar!,
                ),
              ),
            );
          },
          stepContentWidget: (_, data) {
            final stepData = data as StepperItemData;
            return Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
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
                    //occupaation
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
                              onTap: () => Utils.launchWebUrl(
                                  stepData.content['contact_list']['website']),
                              child: Text(
                                stepData.content['contact_list']['website'] ??
                                    '',
                                style: theme.textTheme.caption?.copyWith(
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
      )
    ]);
  }
}
