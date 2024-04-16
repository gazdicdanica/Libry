import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class SearchList extends StatefulWidget {
  final String searchText;
  final String sort;
  const SearchList({super.key, required this.searchText, required this.sort});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _showSearchList = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    context.read<SearchBloc>().add(ResetSearch());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          setState(() {
            _showSearchList = state.libraries.isNotEmpty;
          });
          _animationController.forward();
        } else {
          setState(() {
            _showSearchList = false;
          });
        }
      },
      builder: (context, state) {
        if (_showSearchList) {
          return Center(
            child: AnimatedBuilder(
              animation: _animationController,
              child: ListView.builder(
                itemCount: (state as SearchSuccess).libraries.length,
                itemBuilder: (context, index) {
                  final library = state.libraries[index];
                  return CardWidget(
                    color: library.colorObj,
                    onTap: () {},
                    child: LibrariesCardContet(
                      library: library,
                    ),
                  );
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
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchFailure) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: textColor,
                      size: 60,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.errorMessage,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: themeSeedColor,
                  onPressed: () {
                    context
                        .read<SearchBloc>()
                        .add(LibrariesSearched(widget.searchText, widget.sort));
                  },
                  child: const Icon(Icons.refresh),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is SearchSuccess
                    ? const Icon(Icons.emoji_nature_outlined,
                        size: 80, color: textColor)
                    : const Icon(Icons.search, size: 80, color: textColor),
                const SizedBox(height: 20),
                Text(
                  state is SearchSuccess
                      ? 'There are no found packages for the entered search criteria!'
                      : 'Enter search keyword in order to find packages you are looking for.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
