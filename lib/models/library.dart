import 'package:flutter/material.dart';

class Library {
  final int? contributionsCount;
  final int? dependentReposCount;
  final int? dependentsCount;
  final String? description;
  final int? forks;
  final String? homepage;
  final List<String>? keywords;
  final String? license;
  final String? language;
  final String? latestDownloadUrl;
  final String? latestReleaseNumber;
  final String? latestStableReleaseNumber;
  final String? latestReleasePublishedAt;
  final String? latestStableReleasePublishedAt;
  final String? name;
  final String? platform;
  final int? rank;
  final int? stars;
  String? platformColor;
  bool isFavorite;
  final String? repositoryStatus;

  Library({
    required this.contributionsCount,
    required this.dependentReposCount,
    required this.dependentsCount,
    required this.description,
    required this.forks,
    required this.homepage,
    required this.keywords,
    required this.license,
    required this.language,
    required this.latestDownloadUrl,
    required this.latestReleaseNumber,
    required this.latestStableReleaseNumber,
    required this.latestReleasePublishedAt,
    required this.latestStableReleasePublishedAt,
    required this.name,
    required this.platform,
    required this.rank,
    required this.stars,
    this.platformColor,
    required this.isFavorite,
    required this.repositoryStatus,
  });

  factory Library.fromMap(Map<String, dynamic> map) {
    return Library(
      contributionsCount: map['contributions_count'],
      keywords: List<String>.from(map['keywords']),
      license: map['licenses'],
      latestReleaseNumber: map['latest_release_number'],
      latestStableReleaseNumber: map['latest_stable_release_number'],
      latestReleasePublishedAt: map['latest_release_published_at'],
      latestStableReleasePublishedAt: map['latest_stable_release_published_at'],
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
      stars: map['stars'],
      platformColor: map['platformColor'],
      repositoryStatus: map['repository_status'],
      isFavorite: false,
    );
  }

  Color get colorObj => Color(
      int.parse(platformColor!.toUpperCase().replaceAll("#", ""), radix: 16) +
          0xFF000000);

  List<String>? get filteredKeywords {
    return keywords?.where((keyword) => keyword.trim().isNotEmpty).toList();
  }
}
