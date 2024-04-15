import 'dart:ui';

class Platform {
  final String name;
  final int projectCount;
  final String homepage;
  final String color;
  final String? defaultLanguage;

  const Platform({
    required this.name,
    required this.projectCount,
    required this.homepage,
    required this.color,
    this.defaultLanguage,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      name: json['name'],
      projectCount: json['project_count'],
      homepage: json['homepage'],
      color: json['color'],
      defaultLanguage: json['default_language'],
    );
  }

  Color get colorObj =>
      Color(int.parse(color.toUpperCase().replaceAll("#", ""), radix: 16) +
          0xFF000000);
}
