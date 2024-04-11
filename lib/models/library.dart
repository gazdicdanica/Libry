import 'package:flutter/material.dart';

class Library {
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

  Library(
      {required this.contributionsCount,
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
      this.platformColor});

  factory Library.fromMap(Map<String, dynamic> map) {
    return Library(
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
    );
  }
  Color get colorObj => Color(
      int.parse(platformColor!.toUpperCase().replaceAll("#", ""), radix: 16) +
          0xFF000000);
}

//   {
//   "contributions_count": 13,
//   "dependent_repos_count": 20489,
//   "dependents_count": 57,
//   "deprecation_reason": null,
//   "description": "JavaScript Base62 encode/decoder",
//   "forks": 26,
//   "homepage": "https://github.com/base62/base62.js",
//   "keywords": [
//     "base-62",
//     "encoder",
//     "decoder",
//     "base62",
//     "encoding",
//     "javascript"
//   ],
//   "language": "JavaScript",
//   "latest_download_url": "https://registry.npmjs.org/base62/-/base62-2.0.2.tgz",
//   "latest_release_number": "2.0.2",
//   "latest_release_published_at": "2024-04-02 11:30:29 UTC",
//   "latest_stable_release_number": "2.0.2",
//   "latest_stable_release_published_at": "2024-04-02 11:30:29 UTC",
//   "license_normalized": false,
//   "licenses": "MIT",
//   "name": "base62",
//   "normalized_licenses": [
//     "MIT"
//   ],
//   "package_manager_url": "https://www.npmjs.com/package/base62",
//   "platform": "NPM",
//   "rank": 21,
//   "repository_license": "MIT",
//   "repository_status": null,
//   "repository_url": "https://github.com/base62/base62.js",
//   "stars": 133,
//   "status": null,
//   "versions": [
//     {
//       "number": "0.1.0",
//       "published_at": "2012-02-24 18:04:06 UTC",
//       "spdx_expression": "NONE",
//       "original_license": "",
//       "researched_at": null,
//       "repository_sources": [
//         "NPM"
//       ]
//     },
//    ]
// }

