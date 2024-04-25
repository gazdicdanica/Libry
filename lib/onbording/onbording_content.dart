// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}


List<OnbordingContent> contents=[
  OnbordingContent(
    image: 'assets/images/libry_transparent.png', 
    title: t.welcome, 
    discription: ""),
  OnbordingContent(
    image: 'assets/images/1713866345900.jpeg', 
    title: 'Find Your Perfect Code Companion', 
    discription: ''),
  OnbordingContent(
    image: 'assets/images/details.jpeg', 
    title: 'Discover Package Details', 
    discription: "Explore in-depth information about package to elevate your projects. Dive into detailed descriptions, versions, and more with our package details feature."),
  OnbordingContent(
    image: 'assets/images/favorites.jpeg', 
    title: 'Your favorites!', 
    discription: "Curate your favorite libraries effortlessly and access them anytime, anywhere. Easily add and organize your preferred libraries, then enjoy seamless access to your curated list whenever you need it."),
];