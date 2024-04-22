import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/locale_bloc/locale_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/data_provider/libraries_data_provider.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/data/platforms/data_provider/platforms_data_provider.dart';
import 'package:flutter_internship_2024_app/data/platforms/repository/platforms_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/bottom_navigation.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_internship_2024_app/utils/shared_preferences_util.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load(fileName: ".env");
  await SharedPreferencesUtil().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kReleaseMode) {
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final platformsRepo = PlatformsRepository(PlatformsDataProvider());
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
                LibrariesBloc(context.read<LibrariesRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SearchBloc(context.read<LibrariesRepository>()),
          ),
          BlocProvider(create: (context) => LocaleBloc()..add(InitLocale())),
          BlocProvider(create: (context) => context.read<FavoritesBloc>())
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            if (state is LocaleChanged) {
              LocaleSettings.setLocale(state.locale);
            } else {
              LocaleSettings.useDeviceLocale();
            }
            return TranslationProvider(
              child: MaterialApp(
                title: 'Libry',
                theme: theme,
                home: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const BottomNavigation();
                    }
                    return const AuthScreen();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
