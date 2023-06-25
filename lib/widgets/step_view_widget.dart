import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../utils/utils.dart';

class StepWidget extends StatelessWidget {
  final List<StepperItemData> stepDataList;
  const StepWidget({super.key, required this.stepDataList});

  @override
  Widget build(BuildContext context) {
    final isMobile =
        Utils.getDevice(context) == DeviceType.isMobile ? true : false;
    final theme = Theme.of(context);
    return StepperListView(
      shrinkWrap: true,
      showStepperInLast: true,
      stepperData: stepDataList,
      stepAvatar: (_, data) {
        final stepData = data as StepperItemData;
        return PreferredSize(
          preferredSize: Size.fromRadius(isMobile ? 20 : 25),
          child: CircleAvatar(
            radius: isMobile ? 20 : 25,
            backgroundImage: AssetImage(
              stepData.avatar!,
            ),
          ),
        );
      },
      stepContentWidget: (_, data) {
        final stepData = data as StepperItemData;
        return Container(
          margin: EdgeInsets.only(top: isMobile ? 1 : 30),
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
                    Icon(Icons.school, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 20),
                    Text(stepData.content['occupation'] ?? ''),
                  ],
                ),
                const SizedBox(height: 10),
                //website
                stepData.content['contact_list']['website'] == ""
                    ? const SizedBox()
                    : Row(
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
                                  stepData.content['contact_list']['website'],
                                  maxLines: 2,
                                  style: theme.textTheme.caption?.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                const SizedBox(height: 10),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: theme.primaryColor,
                width: 0.8,
              ),
            ),
          ),
        );
      },
      stepperThemeData: StepperThemeData(
        lineColor: theme.primaryColor,
        lineWidth: 5,
      ),
      physics: const BouncingScrollPhysics(),
    );
  }
}
