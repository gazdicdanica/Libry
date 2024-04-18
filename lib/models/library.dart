import 'package:flutter/material.dart';

class Library {
 //final String uid;
  final int? contributionsCount;
  final int? dependentReposCount;
  final int? dependentsCount;
  final String? description;
  final int? forks;
  final String? homepage;
  final List<String>? keywords;
  final String? language;
  final String? latestDownloadUrl;
  final String? latestReleaseNumber;
  final String? name;
  final String? platform;
  final int? rank;
  String? platformColor;
  bool isFavorite;

  Library(
      {
    //  required this.uid,
      required this.contributionsCount,
      required this.dependentReposCount,
      required this.dependentsCount,
      required this.description,
      required this.forks,
      required this.homepage,
      required this.keywords,
      required this.language,
      required this.latestDownloadUrl,
      required this.latestReleaseNumber,
      required this.name,
      required this.platform,
      required this.rank,
       this.platformColor,
      required this.isFavorite,
      });

  factory Library.fromMap(Map<String, dynamic> map) {
    //String uid=const Uuid().v4();
    return Library(
      //uid: '',
      contributionsCount: map['contributioons_count'],
      keywords: List<String>.from(map['keywords']),
      latestReleaseNumber: map['latest_release_number'],
      dependentReposCount: map['dependent_repos_count'],
      dependentsCount: map['dependents_count'],
      description: map['description'],
      forks: map['forks'],
      homepage: map['homepage'],
      language: map['language'],
      latestDownloadUrl: map['latest_download_url'],
      name: map['name'],
      platform: map['platform'],
      rank: map['rank'],
      platformColor: '',
      isFavorite: false,

    );
  }
  Color get colorObj => Color(
      int.parse(platformColor!.toUpperCase().replaceAll("#", ""), radix: 16) +
          0xFF000000);
}
