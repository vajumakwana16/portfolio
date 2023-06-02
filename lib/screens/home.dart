import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:portfolio/screens/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';

import '../utils/utils.dart';
import '../widgets/intro.dart';
import '../widgets/intro_photoview.dart';
import '../widgets/intro_text.dart';
import '../widgets/social_icons.dart';
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
        // bottomSheet: buildTabBar(),
        bottomNavigationBar: SuperBottomNavigationBar(
          currentIndex: 2,
          items: makeNavItems(),
          onSelected: (index) {
            print('tab $index');
          },
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //progressbar
              Utils.lineProgressBar(_progress),
              //tabs
              SizedBox(
                height: Get.height * 0.85,
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
              )
            ]));
  }

  buildTabBar() => Container(
        color: Colors.black,
        margin: EdgeInsets.all(20.0),
        child: TabBar(
            unselectedLabelColor: Colors.blueGrey,
            controller: tabController,
            overlayColor: MaterialStateProperty.all<Color>(Colors.cyan),
            labelColor: Colors.white,
            indicator: UnderlineTabIndicator(),
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
      SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.home_outlined,
          selectedIcon: Icons.home_outlined,
          size: 30,
          backgroundShadowColor: Colors.red,
          borderBottomColor: Colors.red,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: Colors.red,
          selectedIconColor: Colors.red,
          unSelectedIconColor: Colors.red),
      SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.search_outlined,
          selectedIcon: Icons.search_outlined,
          size: 30,
          backgroundShadowColor: Colors.blue,
          borderBottomColor: Colors.blue,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: Colors.blue,
          selectedIconColor: Colors.blue,
          unSelectedIconColor: Colors.blue),
      SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.star_border_outlined,
          selectedIcon: Icons.star_border_outlined,
          size: 30,
          backgroundShadowColor: Colors.yellowAccent,
          borderBottomColor: Colors.yellowAccent,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: Colors.yellowAccent,
          selectedIconColor: Colors.yellowAccent,
          unSelectedIconColor: Colors.yellowAccent),
      SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.done_outline_rounded,
          selectedIcon: Icons.done_outline_rounded,
          size: 30,
          backgroundShadowColor: Colors.green,
          borderBottomColor: Colors.green,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: Colors.green,
          selectedIconColor: Colors.green,
          unSelectedIconColor: Colors.green),
      SuperBottomNavigationBarItem(
          unSelectedIcon: Icons.person_outline,
          selectedIcon: Icons.person_outline,
          size: 30,
          backgroundShadowColor: Colors.purpleAccent,
          borderBottomColor: Colors.purpleAccent,
          borderBottomWidth: 3,
          // highlightColor: Colors.red,
          // hoverColor: ,
          splashColor: Colors.purpleAccent,
          selectedIconColor: Colors.purpleAccent,
          unSelectedIconColor: Colors.purpleAccent),
    ];
  }
}
