import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPhotoView extends StatelessWidget {
  final double spreadValue;
  final String url;
  final double width;
  const IntroPhotoView(
      {super.key,
      required this.spreadValue,
      required this.url,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
      child: ClipOval(
          child: url == ""
              ? Image.asset("assets/img/vaju.jpg")
              : Image.network(url)),
    );
  }
}
