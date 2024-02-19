import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satset/firebase_options.dart';
import 'package:satset/module/forgot%20password/forgot_password_bloc.dart';
import 'package:satset/module/home/home_bloc.dart';
import 'package:satset/module/login/login_bloc.dart';
import 'package:satset/module/profile/profile_bloc.dart';
import 'package:satset/module/signup/signup_bloc.dart';
import 'package:satset/module/splash%20screen/splash_bloc.dart';
import 'package:satset/module/splash%20screen/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider(create: (BuildContext context) => SplashScreenBloc()),
        BlocProvider(create: (BuildContext context) => SignupBloc()),
        BlocProvider(create: (BuildContext context) => ForgotPasswordBloc()),
        BlocProvider(create: (BuildContext context) => HomeBloc()),
        BlocProvider(create: (BuildContext context) => ProfileBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Satset App',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: SplashScreenPage(),
      ),
    );
  }
}
