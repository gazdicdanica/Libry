import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';

class PlatformsList extends StatefulWidget{
  const PlatformsList({super.key});

  @override
  State<PlatformsList> createState() => _PlatformsListState();
}

class _PlatformsListState extends State<PlatformsList> {

  @override
  void initState() {
    super.initState();
    context.read<PlatformsBloc>().add(PlatformsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformsBloc, PlatformsState>(builder: (context, state){
      if(state is PlatformsLoading){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(state is PlatformsSuccess){
        return Center(
          child: ListView.builder(
            itemCount: state.platforms.length,
            itemBuilder: (context, index){
              print(index);
              print(state.platforms[index]);
              return CardWidget(color: state.platforms[index].colorObj, children: []);
            },
          ),
        );
      }
      if(state is PlatformsFailure){
        return Center(
          child: Text(state.errorMessage),
        );
      }
      return const SizedBox();
    });
  }
}