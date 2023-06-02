import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPhotoView extends StatelessWidget {
  final double spreadValue;
  const IntroPhotoView({super.key, required this.spreadValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.25,
      //height: Get.height * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.shade200,
              blurRadius: 50,
              spreadRadius: spreadValue,
            ),
          ]),
      alignment: Alignment.center,
      child: ClipOval(child: Image.asset("assets/img/vaju.jpg")),
    );
  }
}
