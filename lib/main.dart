import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/domain/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_app/domain/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_bloc_app/presentation/screens/login/login_page.dart';
import 'package:flutter_bloc_app/presentation/screens/welcome/welcome_page.dart';
import 'package:flutter_bloc_app/presentation/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'domain/bloc/welcome_bloc/welcome_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme().getTheme(),
        home: const WelcomePage(),
        routes: {
          "loginPage": (context) => const LoginPage(),
        },
      ),
    );
  }
}
