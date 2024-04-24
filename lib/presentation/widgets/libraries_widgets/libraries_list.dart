import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/models/platform.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/error_message_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/pagination/end_indicator.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/pagination/new_page_error.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LibrariesList extends StatefulWidget {
  final Platform platform;
  final String sort;

  const LibrariesList({super.key, required this.platform, required this.sort});

  @override
  State<LibrariesList> createState() {
    return _LibrariesListState();
  }
}

class _LibrariesListState extends State<LibrariesList> {
  String? platfromName;
  String? sort;
  int page = 1;

  final PagingController<int, Library> _pagingController =
      PagingController(firstPageKey: 0);
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    platfromName = widget.platform.name;
    sort = widget.sort;
    _pagingController.addPageRequestListener((pageKey) {
      context
          .read<LibrariesBloc>()
          .add(FetchLibraries(platfromName!, sort!, page));
    });

    _subscription = context.read<LibrariesBloc>().stream.listen((state) {
      if (state is LibrariesSuccess) {
        if (state.libraries.isEmpty) {
          _pagingController.appendLastPage(state.libraries);
        } else {
          final isLastPage = state.libraries.length < 30;
          if (isLastPage) {
            _pagingController.appendLastPage(state.libraries);
          } else {
            page++;
            final nextPageKey = state.libraries.length;
            _pagingController.appendPage(state.libraries, nextPageKey);
          }
        }
      }
      if (state is LibrariesFailure) {
        _pagingController.error = state.error;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return SafeArea(
      child: PagedListView<int, Library>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Library>(
          itemBuilder: (context, library, index) {
            return CardWidget(
              color: widget.platform.colorObj,
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _subscription.cancel();
  }
}
