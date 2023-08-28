import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_bloc/logic/login_cubit/login_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app_bloc/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Neue Montreal",
          brightness: Brightness.dark,
          useMaterial3: true,
          colorScheme: const ColorScheme.dark(
            background: Color(0xff131313),
            onPrimary: Color(0xff131313),
          ),
        ),
        // home: const LoginPage(),
        routerConfig: router,
      ),
    );
  }
}
