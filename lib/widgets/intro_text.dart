import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';

class IntroTexts extends StatelessWidget {
  const IntroTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Utils.addHriSpace(Get.width * 0.05),
        const Text('Playing with ❣', style: TextStyle(fontSize: 43.0)),
        Utils.addHriSpace(Get.width * 0.02),
        SizedBox(
          height: Get.width * 0.2,
          child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: textColor),
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText('FLUTTER'),
                  RotateAnimatedText('ANDROID'),
                  RotateAnimatedText('DART'),
                  RotateAnimatedText('JAVA'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              )),
        ),
      ],
    );
  }
}
