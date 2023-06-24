import 'package:flutter/material.dart';

List<Skill> technologiesList = [
  Skill("Flutter", "definition", 75, FlutterLogo()),
  Skill("Dart", "definition", 70, Image.asset("assets/logos/dart.png")),
  Skill("Java", "definition", 80, Image.asset("assets/logos/java.png")),
  Skill("PHP", "definition", 60, Image.asset("assets/logos/php.png")),
  Skill("JavaScript", "definition", 45,
      Image.asset("assets/logos/javascript.png")),
  Skill(
      "BootStrap", "definition", 40, Image.asset("assets/logos/bootstrap.png")),
  Skill("HTML", "definition", 40, Image.asset("assets/logos/html.png")),
  Skill("CSS", "definition", 40, Image.asset("assets/logos/css.png")),
  Skill("JQuery", "definition", 40, Image.asset("assets/logos/jQuery.png")),
];

class Skill {
  final String name;
  final String definition;
  final double progress;
  final Widget logo;

  Skill(this.name, this.definition, this.progress, this.logo);
}
