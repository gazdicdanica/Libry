import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/error_message_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/no_items_found.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/pagination/end_indicator.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/pagination/new_page_error.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  int page = 1;

  final PagingController<int, Library> _pagingController =
      PagingController(firstPageKey: 0);
  late StreamSubscription _subscription;

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

    _pagingController.addPageRequestListener((pageKey) {
      context
          .read<SearchBloc>()
          .add(LibrariesSearched(widget.searchText, widget.sort, page));
    });

    _subscription = context.read<SearchBloc>().stream.listen((state) {
      if (state is SearchLoading && state.newSearch) {
        _pagingController.refresh();
      }
      if (state is SearchInitial) {
        setState(() {
          _showSearchList = false;
          page = 1;
        });
      } else {
        setState(() {
          _showSearchList = true;
        });
      }
      if (state is SearchSuccess) {
        if (state.libraries.isEmpty) {
          _pagingController.appendLastPage(state.libraries);
        } else {
          if (state.libraries.length < 30) {
            _pagingController.appendLastPage(state.libraries);
          } else {
            page++;
            _pagingController.appendPage(
                state.libraries, state.libraries.length);
          }
        }
      }
      if (state is SearchFailure) {
        _pagingController.error = state.errorMessage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (_showSearchList) {
      // _pagingController.refresh();
      return SafeArea(
        child: PagedListView<int, Library>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Library>(
            itemBuilder: (context, library, index) {
              return CardWidget(
                color: library.colorObj,
                onTap: () {},
                child: LibrariesCardContet(
                  library: library,
                ),
              );
            },
            firstPageErrorIndicatorBuilder: (context) => ErrorMessageWidget(
              errorMessage: t.libraries_error,
              refreshFunction: () => _pagingController.refresh(),
            ),
            newPageErrorIndicatorBuilder: (context) => NewPageErrorIndicator(
                onTryAgain: () => _pagingController.retryLastFailedRequest()),
            noMoreItemsIndicatorBuilder: (context) => const EndIndicator(),
            noItemsFoundIndicatorBuilder: (context) =>
                NoItemsFound(message: t.search_empty),
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              t.search_hint,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pagingController.dispose();
    _subscription.cancel();
    super.dispose();
  }
}
