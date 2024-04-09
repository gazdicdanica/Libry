import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/models/platform.dart';
import 'package:flutter_internship_2024_app/presentation/screens/libraries_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/platforms/platforms_card_overlay.dart';

class PlatformsList extends StatefulWidget {
  const PlatformsList({super.key});

  @override
  State<PlatformsList> createState() => _PlatformsListState();
}

class _PlatformsListState extends State<PlatformsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    context.read<PlatformsBloc>().add(PlatformsRequested());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _goToLibrariesPage(Platform platform){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LibrariesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformsBloc, PlatformsState>(
        builder: (context, state) {
      if (state is PlatformsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PlatformsSuccess) {
        _animationController.forward();
        return Center(
          child: AnimatedBuilder(
            animation: _animationController,
            child: ListView.builder(
              itemCount: state.platforms.length,
              itemBuilder: (context, index) {
                return CardWidget(
                    color: state.platforms[index].colorObj,
                    onTap: () {
                      _goToLibrariesPage(state.platforms[index]);
                    },
                    child: PlatformsCardOverlay(
                      platform: state.platforms[index],
                    ));
              },
            ),
            builder: (context, child) {
              return Opacity(
                opacity: _animationController.value,
                child: Transform.translate(
                  offset: Offset(0, 100 * (1 - _animationController.value)),
                  child: child,
                ),
              );
            },
          ),
        );
      }
      if (state is PlatformsFailure) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      return const SizedBox();
    });
  }
}
