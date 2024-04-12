import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/models/platform.dart';
import 'package:flutter_internship_2024_app/presentation/screens/libraries_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/error_message_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/platforms/platforms_card_overlay.dart';
import 'package:flutter_internship_2024_app/theme.dart';

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

  void _goToLibrariesPage(Platform platform) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LibrariesScreen(
              platform: platform,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PlatformsBloc, PlatformsState>(
          builder: (context, state) {
        if (state is PlatformsFailure) {
          return ErrorMessageWidget(
              errorMessage: state.errorMessage,
              refreshFunction: () {
                context.read<PlatformsBloc>().add(PlatformsRequested());
              });
        }
        if (state is! PlatformsSuccess) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        _animationController.forward();
        if (state.platforms.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.emoji_nature,
                  color: textColor,
                  size: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "There are no platforms found.",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          );
        }
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
      }),
    );
  }
}
