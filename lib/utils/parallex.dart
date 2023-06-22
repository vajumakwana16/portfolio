/*
MIT License
Copyright (c) 2020 Mariano Zorrilla
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'package:flutter/material.dart';
import 'dart:html' as html;

const String FIREBASE = 'https://firebasestorage.googleapis.com';
const String IMG_BG =
    '$FIREBASE/v0/b/qandtena.appspot.com/o/background.jpg?alt=media';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '{Q&10A}',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;
  bool downButton = false;

  double scaleX = 1;
  double scaleY = 1;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  void _setupAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    )..addListener(() => setState(() {
          scaleX = animation.value;
          scaleY = animation.value;
        }));
    animation = Tween<double>(begin: 1, end: 0.9).animate(CurvedAnimation(
      curve: Curves.decelerate,
      parent: animationController!,
    ));
  }

  void _scaleAnimation() {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => downButton = true);
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double percentageX = (localX / (size.width * 0.45) / 2) * 100;
    double percentageY = (localY / ((size.height / 2) + 70) / 1.5) * 100;

    double screen = (size.width - 150) / (1280 - 150);
    screen = screen > 1.0
        ? 1.0
        : screen < 0
            ? 0
            : screen;
    double limits = ((screen * 100) * (0.4 - 0.75) / 100) + 0.75;
    double fontSize = ((screen * 100) * (1.0 - 0.3) / 100) + 0.3;

    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(IMG_BG, fit: BoxFit.cover),
          Opacity(
            opacity: 0.75,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF512DA8), Color(0xFFF57C00)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: [
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                MaterialButton(
                  onPressed: () =>
                      html.window.location.href = 'mailto:mkiisoft@gmail.com',
                  child: Text(
                    'Contact',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            body: new Container(
              color: Colors.transparent,
            ),
          ),
          UtilsParallex.powered(),
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(
                    defaultPosition ? 0 : (1.2 * (percentageY / 50) + -1.2))
                ..rotateY(
                    defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
              alignment: FractionalOffset.center,
              child: MouseRegion(
                onEnter: (_) => setState(() => defaultPosition = false),
                onExit: (_) => setState(() {
                  localY = (size.height) / 2;
                  localX = (size.width * 0.45) / 2;
                  defaultPosition = true;
                }),
                onHover: (details) {
                  if (mounted) setState(() => defaultPosition = false);
                  if (details.localPosition.dx > 0 &&
                      details.localPosition.dy > 0) {
                    if (details.localPosition.dx < (size.width * 0.45) * 1.5 &&
                        details.localPosition.dy > 0) {
                      localX = details.localPosition.dx;
                      localY = details.localPosition.dy;
                    }
                  }
                },
                child: GestureDetector(
                  onTapDown: (_) => _scaleAnimation(),
                  onTapUp: (_) {},
                  child: Stack(
                    children: [
                      Transform(
                        transform: Matrix4.identity()..scale(scaleX, scaleY),
                        alignment: FractionalOffset.center,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 100,
                              maxHeight: 140,
                              maxWidth: size.width * limits),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x70000000),
                                    blurRadius: 30,
                                    spreadRadius: -30,
                                    offset: Offset(0, 60),
                                  )
                                ]),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: Stack(
                                    children: [
                                      Transform(
                                        transform: Matrix4.identity()
                                          ..translate(
                                              defaultPosition
                                                  ? 0.0
                                                  : (70 * (percentageX / 50) +
                                                      -70),
                                              defaultPosition
                                                  ? 0.0
                                                  : (80 * (percentageY / 50) +
                                                      -80),
                                              0.0),
                                        alignment: FractionalOffset.center,
                                        child: Text(
                                          '{Q&10A}​',
                                          style: TextStyle(
                                            fontSize: 120 * fontSize,
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.w800,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UtilsParallex {
  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static Widget powered() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 150,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20, top: 10),
          child: GestureDetector(
            onTap: () => html.window.location.href = 'https://www.flutter.dev',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered by',
                  style: TextStyle(
                      fontFamily: 'Sans', fontSize: 16, color: Colors.white),
                ),
                SizedBox(width: 5),
                Semantics(
                  child: FlutterLogo(),
                  label: "Flutter",
                  readOnly: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
