import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';

class LibrariesList extends StatefulWidget {
  final platform;
  final sort;

  const LibrariesList({super.key, this.platform, this.sort});

  @override
  State<LibrariesList> createState() {
    return _LibrariesListState();
  }
}

class _LibrariesListState extends State<LibrariesList> {
  String? platfromName;
  String? sort;

  @override
  void initState() {
    super.initState();
    platfromName = widget.platform.name;
    sort = widget.sort;
    context.read<LibrariesBloc>().add(LibrairesFetched(platfromName!, sort!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibrariesBloc, LibrariesState>(
        builder: (context, state) {
      if (state is LibrariesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is LibrariesSuccess) {
        return Center(
          child: ListView.builder(
              itemCount: state.libraries.length,
              itemBuilder: (context, index) {
                return CardWidget(
                  color: widget.platform.colorObj,
                  onTap: () {},
                  child: LibrariesCardContet(
                    library: state.libraries[index],
                  ),
                );
              }),
        );
      }
      if (state is LibrariesFailure) {
        return Center(
          child: Text(state.error),
        );
      }
      return const SizedBox();
    });
  }
}