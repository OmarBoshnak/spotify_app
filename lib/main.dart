import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spoti_third/firebase_options.dart';
import 'package:spoti_third/presentation/auth/pages/signin.dart';
import 'package:spoti_third/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spoti_third/presentation/home/pages/home_screen.dart';
import 'package:spoti_third/presentation/home/widgets/news_song.dart';
import 'package:spoti_third/presentation/layout/bloc/bottom_nav_bar_cubit.dart';
import 'package:spoti_third/presentation/layout/layout_screen.dart';
import 'package:spoti_third/presentation/splash/page/splash_screen.dart';
import 'package:spoti_third/service_loactor.dart';

import 'core/configs/theme/app_theme.dart';
import 'presentation/home/bloc/new_song_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            themeMode: mode,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            title: 'Spotify',
            darkTheme: AppTheme.darkTheme,
            home: AuthStream(),
          );
        },
      ),
    );
  }
}

class AuthStream extends StatelessWidget {
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LayoutScreen();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
