

import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/main.dart';
import 'package:flutter_internship_2024_app/onbording/onbording_content.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class Onbording extends StatefulWidget{
  const Onbording({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState()=> _OnbordingState();

}

class _OnbordingState extends State<Onbording>{


  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Padding(
      key: K.nextBtn,
       padding: const EdgeInsets.all(0),
       child: OnBoardingSlider(
        onFinish: (){
                  Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
          );
           isOnboardingShown = true;
        },
        finishButtonText:  'Sign up',
        finishButtonTextStyle: const TextStyle(color: textColor),
        finishButtonStyle: FinishButtonStyle(
          focusColor: textColor,
          hoverColor: textColor,
           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
           foregroundColor: textColor,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80),
           )
        ),
        totalPage: contents.length, 
        headerBackgroundColor: Theme.of(context).colorScheme.background, 
        speed: 1.5, 
        background: [
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,),
          ], 
        pageBodies: 
        List.generate(contents.length,(index){
        return SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child:   MediaQuery.of(context).orientation == Orientation.portrait 
              ? Padding(
                padding: const EdgeInsets.fromLTRB(10,60,10,10),
                child: Column(
                  children: [
                      SizedBox(child: Image.asset(contents[index].image,height: 400,)),
                      const SizedBox(height: 20,),
                      Text(contents[index].title,
                        style: Theme.of(context).textTheme.labelLarge, 
                        textAlign: TextAlign.center,),
                       const SizedBox(height: 20,),
                      Text(contents[index].discription,style: Theme.of(context).textTheme.bodyLarge
                      ,textAlign: TextAlign.center,),
                ],),
              )
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(contents[index].image),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Text(contents[index].title, style: Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.right,),
                                  const SizedBox(height: 10,),
                                  Text(contents[index].discription, 
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ],),
              )
          ),
        );
        },),  
        skipTextButton:  const Text('Skip', style: TextStyle(color: textColor,fontSize: 11),)
        ),
        
     ),
   );
  }

}