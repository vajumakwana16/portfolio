import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';

import '../utils/utils.dart';
import '../widgets/intro.dart';
import 'contact.dart';
import 'experience.dart';
import 'skills.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _progress = 0.0;
  double spreadValue = 0;
  int _currentIndex = 0;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        setState(() {
          _progress = scrollController.position.pixels /
              scrollController.position.maxScrollExtent;
        });
      });

      setNeonEffectTimer();
    });
  }

  setNeonEffectTimer() {
    const oneSec = Duration(seconds: 2);
    Timer.periodic(oneSec, (Timer t) {
      if (mounted) {
        if (spreadValue == 12) {
          setState(() {
            spreadValue = 0;
          });
        } else if (spreadValue == 0) {
          setState(() {
            spreadValue = 4;
          });
        } else if (spreadValue == 4) {
          setState(() {
            spreadValue = 7;
          });
        } else if (spreadValue == 7) {
          setState(() {
            spreadValue = 10;
          });
        } else {
          setState(() {
            spreadValue = 12;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  final skillKey = GlobalKey();
  final educationKey = GlobalKey();
  final experienceKey = GlobalKey();

  final animateDuration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.getDevice(context) == DeviceType.isMobile;

    return Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        bottomSheet: Utils.lineProgressBar(_progress),
        bottomNavigationBar: SuperBottomNavigationBar(
          curve: Curves.bounceInOut,
          currentIndex: _currentIndex,
          backgroundColor: Colors.black,
          items: makeNavItems(),
          onSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 0) {
              scrollController.animateTo(
                  scrollController.position.minScrollExtent,
                  duration: defaultDuration,
                  curve: Curves.fastLinearToSlowEaseIn);
            } else if (index == 1) {
              //Scrollable.of(skillKey.currentContext!).deltaToScrollOrigin

              Scrollable.ensureVisible(skillKey.currentContext!,
                  curve: Curves.easeInToLinear, duration: animateDuration);
              /* scrollController.animateTo(Get.height,
                  duration: defaultDuration,
                  curve: Curves.fastLinearToSlowEaseIn);*/
            } else if (index == 2) {
              Scrollable.ensureVisible(educationKey.currentContext!,
                  curve: Curves.easeInToLinear, duration: animateDuration);
            } else if (index == 3) {
              Scrollable.ensureVisible(experienceKey.currentContext!,
                  curve: Curves.easeInToLinear, duration: animateDuration);
            } else if (index == 4) {
              scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: defaultDuration,
                  curve: Curves.fastLinearToSlowEaseIn);
            }
          },
        ),
        body: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Intro(spreadValue: spreadValue),
                Skills(key: skillKey),
                Education(key: educationKey),
                Experience(key: experienceKey),
                const Contact(),
              ],
            ),
          ),
        ));
  }

  List<SuperBottomNavigationBarItem> makeNavItems() {
    return [
      const SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.home_outlined,
          selectedIcon: Icons.home,
          size: 30,
          backgroundShadowColor: primaryColor,
          borderBottomColor: primaryColor,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: primaryColor,
          selectedIconColor: primaryColor,
          unSelectedIconColor: primaryColor),
      const SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.bolt_outlined,
          selectedIcon: Icons.bolt,
          size: 30,
          backgroundShadowColor: primaryColor,
          borderBottomColor: primaryColor,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: primaryColor,
          selectedIconColor: primaryColor,
          unSelectedIconColor: primaryColor),
      const SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.book_outlined,
          selectedIcon: Icons.book,
          size: 30,
          backgroundShadowColor: primaryColor,
          borderBottomColor: primaryColor,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: primaryColor,
          selectedIconColor: primaryColor,
          unSelectedIconColor: primaryColor),
      const SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.work_history_outlined,
          selectedIcon: Icons.work_history,
          size: 30,
          backgroundShadowColor: primaryColor,
          borderBottomColor: primaryColor,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: primaryColor,
          selectedIconColor: primaryColor,
          unSelectedIconColor: primaryColor),
      const SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.contact_mail_outlined,
          selectedIcon: Icons.contact_mail,
          size: 30,
          backgroundShadowColor: primaryColor,
          borderBottomColor: primaryColor,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: primaryColor,
          selectedIconColor: primaryColor,
          unSelectedIconColor: primaryColor)
    ];
  }
}
