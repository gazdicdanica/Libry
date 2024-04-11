import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_provider.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/presentation/screens/platforms_screen.dart';
import 'package:flutter_internship_2024_app/theme.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // open to refactoring
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PlatformsRepository(PlatformsDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => (LibrariesRepository(LibrariesProvider(),
              PlatformsRepository(PlatformsDataProvider()))),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PlatformsBloc(context.read<PlatformsRepository>())),
          BlocProvider(
            create: (context) =>
                LibrariesBloc(context.read<LibrariesRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SearchBloc(context.read<LibrariesRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Package Manager App',
          theme: theme,
          home: const PlatformsScreen(),
        ),
      ),
    );
  }
}
