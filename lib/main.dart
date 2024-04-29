// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/locale_bloc/locale_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_data_provider.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/data/shared_preferences/prefs_data_provider/prefs_data_provider.dart';
import 'package:flutter_internship_2024_app/data/shared_preferences/prefs_repository/prefs_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/onbording/onbording.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/bottom_navigation.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool isOnboardingShown = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  final prefsDataProvider = PrefsDataProvider();
  await prefsDataProvider.init();
  final prefsRepo = PrefsRepository(prefsDataProvider);

  runApp(MyApp(prefsRepo));
}

class MyApp extends StatelessWidget {
  const MyApp(this.prefsRepo, {super.key});

  final PrefsRepository prefsRepo;

  @override
  Widget build(BuildContext context) {
    final platformsRepo = PlatformsRepository(PlatformsDataProvider());

    final themeMode = prefsRepo.getTheme() ?? ThemeMode.system;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: platformsRepo,
        ),
        RepositoryProvider(
          create: (context) => LibrariesRepository(
            LibrariesDataProvider(),
            platformsRepo,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PlatformsBloc(context.read<PlatformsRepository>())),
          BlocProvider(
            create: (context) =>
                SearchBloc(context.read<LibrariesRepository>()),
          ),
          BlocProvider(
              create: (context) => LocaleBloc(prefsRepo)..add(InitLocale())),
          BlocProvider(
              create: (context) =>
                  ThemeBloc(prefsRepo)..add(ChangeTheme(themeMode))),
          BlocProvider(create: (context) => context.read<FavoritesBloc>())
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            if (state is LocaleChanged) {
              LocaleSettings.setLocale(state.locale);
            } else {
              LocaleSettings.useDeviceLocale();
            }

            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return TranslationProvider(
                  child: MaterialApp(
                    title: 'Libry',
                    theme: theme,
                    darkTheme: darkTheme,
                    themeMode:
                        state is ThemeChanged ? state.themeMode : themeMode,
                    home: StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          isOnboardingShown = true;
                          return const BottomNavigation();
                        }
                        return Navigator(
                          onGenerateRoute: (routeSettings) {
                            return MaterialPageRoute(
                              builder: (context) => isOnboardingShown
                                  ? const AuthScreen()
                                  : const Onbording(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
