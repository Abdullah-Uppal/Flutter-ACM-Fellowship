import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitter_clone_material/cubits/auth/auth_cubit.dart';
import 'package:twitter_clone_material/cubits/tweets/tweets_cubit.dart';
import 'package:twitter_clone_material/presentation/screens/home_screen.dart';
import 'package:twitter_clone_material/presentation/screens/login_screen.dart';
import 'package:twitter_clone_material/presentation/screens/signup_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://twtfhrxptbduynlcpxtv.supabase.co/',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR3dGZocnhwdGJkdXlubGNweHR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2MjQzOTIsImV4cCI6MjAxMTIwMDM5Mn0.VjOhcCsZsik0IuiX6iLZU3VcB79vBFvFEU474itouQ4',
  );

  runApp(BlocProvider(
    lazy: false,
    create: (context) => AuthCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const LoginScreen(),
            );
          case '/signup':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SignupScreen(),
            );
          case '/home':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  BlocProvider(
                create: (context) => TweetsCubit(),
                child: const HomeScreen(),
              ),
            );
        }
      },
    );
  }
}
