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
    image: 'assets/images/packages.png', 
    title: t.welcome_onboarding, 
    discription: t.onborading_description_welcome),
  OnbordingContent(
    image: 'assets/images/details.png', 
    title: t.onborading_title_details, 
    discription: t.onborading_description_details),
     OnbordingContent(
    image: 'assets/images/search.png', 
    title: t.onborading_title_search, 
    discription:t.onborading_description_search ),
    OnbordingContent(
    image: 'assets/images/favorites.png', 
    title: t.onborading_title_favorites, 
    discription: t.onborading_description_favorites),
    ];