import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app_bloc/logic/notes_cubit/notes_cubit.dart';
import 'package:notes_app_bloc/presentation/screens/add_note_page.dart';
import 'package:notes_app_bloc/presentation/screens/login_page.dart';
import 'package:notes_app_bloc/presentation/screens/notes_page.dart';
import 'package:notes_app_bloc/repositories/notes_repository.dart';

final _notesCubit = NotesCubit(NotesRepository());


final router = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider.value(
        value: _notesCubit,
        child: const NotesPage(),
      ),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => BlocProvider.value(
        value: _notesCubit,
        child: const AddNotePage(),
      ),
    ),
  ],
);
