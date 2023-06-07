import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';

import '../utils/utils.dart';
import '../widgets/intro.dart';
import 'contact.dart';
import 'skills.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> with TickerProviderStateMixin {
  double _progress = 0.0;
  double spreadValue = 0;
  int _currentIndex = 0;
  final scrollController = ScrollController();
  late final tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);

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
              scrollController.animateTo(Get.height,
                  duration: defaultDuration,
                  curve: Curves.fastLinearToSlowEaseIn);
            } else if (index == 2) {
              scrollController.animateTo(Get.height * 2,
                  duration: defaultDuration,
                  curve: Curves.fastLinearToSlowEaseIn);
            } else if (index == 3) {
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
                const Skills(),
                const Education(),
                const Contact(),
              ],
            ),
          ),
        ));
  }

  buildTabBar() => Container(
        color: Colors.black,
        margin: const EdgeInsets.all(20.0),
        child: TabBar(
            unselectedLabelColor: Colors.blueGrey,
            controller: tabController,
            overlayColor: MaterialStateProperty.all<Color>(Colors.cyan),
            labelColor: Colors.white,
            indicator: const UnderlineTabIndicator(),
            onTap: (index) {
              if (index == 0) {
                scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: defaultDuration,
                    curve: Curves.fastLinearToSlowEaseIn);
              } else if (index == 1) {
                scrollController.animateTo(Get.height,
                    duration: defaultDuration,
                    curve: Curves.fastLinearToSlowEaseIn);
              } else if (index == 2) {
                scrollController.animateTo(Get.height * 2,
                    duration: defaultDuration,
                    curve: Curves.fastLinearToSlowEaseIn);
              } else if (index == 3) {
                scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: defaultDuration,
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            },
            tabs: const [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.bolt_outlined), text: 'Skills'),
              Tab(icon: Icon(Icons.book_outlined), text: 'Education'),
              Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
            ]),
      );

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
