import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/onbording/onbording_content.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class Onbording extends StatefulWidget{
  //const Onbording({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState()=> _OnbordingState();

}

class _OnbordingState extends State<Onbording>{
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Padding(
       padding: const EdgeInsets.all(20.0),
       child: OnBoardingSlider(
        onFinish: (){
          Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => const AuthScreen(  ),
          ),
        );
        },
        finishButtonStyle: FinishButtonStyle(
           backgroundColor: Theme.of(context).colorScheme.background,
        ),
       
        totalPage: contents.length, 
        headerBackgroundColor: Theme.of(context).colorScheme.background, 
        speed: 1.5, 
        background: [
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,),
         Container(color:  Theme.of(context).colorScheme.background,)
          ], 
        pageBodies: 
        List.generate(contents.length,(index){
        return SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
              child:  Column(
                children: [
                 //   SizedBox(height: contents[index].height,),
                    Image.asset(contents[index].image),
                    SizedBox(height: 10,),
                    Text(contents[index].title),
                     SizedBox(height: 10,),
                    Text(contents[index].discription),
              ],),
          ),
        );
        },),  
        
        skipTextButton: const Text(
        'Skip',
          style: TextStyle(
            color: textColor,
         ),
        ),
        ),
     ),
   );
  }

}