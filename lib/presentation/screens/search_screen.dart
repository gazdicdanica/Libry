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
      appBar: AppBar(
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
                  onTextChanged: (text) {
                    setState(() {
                      searchText = text;
                    });
                  },
                ),
                Expanded(
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

    if (isPortrait) {
      return MediaQuery.of(context).size.height -
          appBarHeight -
          statusBarHeight -
          keyboardHeight;
    } else {
      return MediaQuery.of(context).size.height -
          appBarHeight -
          statusBarHeight;
    }
  }
}
