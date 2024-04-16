import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_data_provider.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/screens/platforms_screen.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => (LibrariesRepository(LibrariesDataProvider(),
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
          title: 'Libry',
          theme: theme,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const PlatformsScreen();
              }
              return const AuthScreen();
            },
          ),
        ),
      ),
    );
  }
}
