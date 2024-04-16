import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_internship_2024_app/bloc/platforms_bloc/platforms_bloc.dart';
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
    return RepositoryProvider(
      create: (context) => PlatformsRepository(PlatformsDataProvider()),
      child: BlocProvider(
        create: (context) => PlatformsBloc(context.read<PlatformsRepository>()),
        child: MaterialApp(
          title: 'Package Manager App',
          theme: theme,
          home: StreamBuilder(
<<<<<<< HEAD
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const PlatformsScreen();
              }
              return const AuthScreen();
            },
          ),
=======
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return const PlatformsScreen();
            }
            return const AuthScreen();
          },
        ),
>>>>>>> fb944199143d30a32aa1e506fb30a86ac15b87cf
        ),
      ),
    );
  }
}
