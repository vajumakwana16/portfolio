List<Tech> technologiesList = [
  Tech("Flutter", "definition", 75),
  Tech("Dart", "definition", 70),
  Tech("Java", "definition", 80),
  Tech("PHP", "definition", 60),
  Tech("JavaScript", "definition", 45),
  Tech("Ajax", "definition", 40),
];

class Tech {
  final String name;
  final String definition;
  final double progress;

  Tech(this.name, this.definition, this.progress);
}
