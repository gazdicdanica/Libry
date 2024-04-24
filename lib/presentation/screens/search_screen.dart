import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/search/search_input_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/search/search_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String searchText = '';
  late String sort = '';

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      key: const Key('backBtn'),
      appBar: AppBar(
        //key: const Key('backBtn'),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            t.search,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        centerTitle: false,
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: calculateBodyHeight(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SearchInput(
                  key: const Key('searchInputField'),
                  onTextChanged: (text) {
                    setState(() {
                      searchText = text;
                    });
                  },
                ),
                Expanded(
                 key: const Key('searchList'),
                  child: SearchList(
                    searchText: searchText,
                    sort: sort,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateBodyHeight(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    int padding = Theme.of(context).platform == TargetPlatform.iOS ? 40 : 0;

    if (isPortrait) {
      return MediaQuery.of(context).size.height -
          appBarHeight -
          statusBarHeight -
          keyboardHeight - padding;
    } else {
      return MediaQuery.of(context).size.height -
          appBarHeight -
          statusBarHeight - padding;
    }
  }
}
