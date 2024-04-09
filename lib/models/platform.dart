class Platform {

  final String name;
  final int projectCount;
  final String homepage;
  final String color;
  final String defaultLanguage;


  Platform({
    required this.name,
    required this.projectCount,
    required this.homepage,
    required this.color,
    required this.defaultLanguage,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    print(json);
    return Platform(
      name: json['name'],
      projectCount: json['project_count'],
      homepage: json['homepage'],
      color: json['color'],
      defaultLanguage: json['default_language'] ?? '/',
    );
  }
}
