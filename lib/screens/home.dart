import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:portfolio/utils/constants.dart';

import '../utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  double _progress = 0.0;
  Color _progressColor = Colors.red;

  List colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.blueGrey,
    Colors.red,
    Colors.blueAccent,
    Colors.orange,
    Colors.white,
    Colors.purple,
    Colors.greenAccent,
    Colors.cyan,
    Colors.green,
  ];

  void _incrementCounter() {
    setState(() {
      _progress += 0.1;
      _progressColor = colorList[_counter];
      _counter++;
    });
  }

  final scrollController = ScrollController();

  double spreadValue = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        _progress = scrollController.position.pixels /
            scrollController.position.maxScrollExtent;
      });
    });

    setNeonEffectTimer();
  }

  setNeonEffectTimer() {
    const oneSec = Duration(seconds: 2);
    Timer.periodic(oneSec, (Timer t) {
      if (spreadValue == 20) {
        setState(() {
          spreadValue = 7;
        });
      } else if (spreadValue == 7) {
        setState(() {
          spreadValue = 14;
        });
      } else {
        setState(() {
          spreadValue = 20;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NeonLine(
                lineWidth: Get.width * _progress,
                lineHeight: 1,
                lightSpreadRadius: 10,
                spreadColor: Colors.white,
                lineColor: primaryColor),
            SizedBox(
              height: Get.height * 0.98,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    buildIntro(isMobile),
                    buildSocials(),
                    buildKnowledgeInfo()
                  ],
                ),
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  buildIntro(isMobile) => SizedBox(
        height: Get.height * 0.9,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: [
              SizedBox(
                height: isMobile ? Get.height * 0.1 : Get.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 20.0, height: 10.0),
                    const Text(
                      'Playing with this Techs ❣',
                      style: TextStyle(fontSize: 43.0),
                    ),
                    const SizedBox(width: 20.0, height: 10.0),
                    SizedBox(
                      height: Get.height * 0.1,
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
                ),
              ),
              SizedBox(
                height: isMobile ? Get.height * 0.7 : Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.2,
                      height: Get.height * 0.4,
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
                      child:
                          ClipOval(child: Image.asset("assets/img/vaju.jpg")),
                    ),
                  ],
                ),
              ),
            ]),
      );

  buildKnowledgeInfo() => SizedBox(
        height: Get.height,
      );

  buildSocials() => SizedBox(
      height: Get.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialIcon(FontAwesomeIcons.linkedin, ""),
          buildSocialIcon(FontAwesomeIcons.instagram, ""),
          buildSocialIcon(FontAwesomeIcons.facebook, ""),
          buildSocialIcon(FontAwesomeIcons.twitter, ""),
        ],
      ));

  buildSocialIcon(icon, link) => IconButton(
      icon: FaIcon(icon,
          size: Get.width * 0.02, color: Theme.of(context).primaryColor),
      onPressed: () {});
}
