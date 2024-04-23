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
    discription: 'This is going to be libraries page'),
  OnbordingContent(
    image: 'assets/images/1713866345900.jpeg', 
    title: 'Libraries page', 
    discription: 'This is going to be libraries page'),
  OnbordingContent(
    image: 'assets/images/search.jpeg', 
    title: 'Searcing libraries', 
    discription: 'this is going to be search page'),
  OnbordingContent(
    image: 'assets/images/details.jpeg', 
    title: 'Details of library', 
    discription: 'this is going to be detailspage'),
  OnbordingContent(
    image: 'assets/images/favorites.jpeg', 
    title: 'Your favorites!', 
    discription: 'this is going to be favorites  page'),
];