import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/pages/Log_In.dart';
import 'package:scholar_chat_app/pages/chatPage.dart';
import 'package:scholar_chat_app/pages/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat_app/pages/cubits/register_cubit/register_cubit.dart';
import 'package:scholar_chat_app/pages/onBourding.dart';
import 'package:scholar_chat_app/pages/register.dart';
import 'package:scholar_chat_app/pages/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          'splash': (context) => splashh(),
          'OnBourding': (context) => OnBourding(),
          'LogIn': (context) => LogIn(),
          'Register': (context) => Register(),
          'ChatPage': (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
      ),
    );
  }
}
