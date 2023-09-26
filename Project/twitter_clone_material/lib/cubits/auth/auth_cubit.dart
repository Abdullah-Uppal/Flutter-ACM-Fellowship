import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitter_clone_material/data/models/profile.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {}
  Future<void> login(String email, String password) async {
    final supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth
        .signInWithPassword(email: email, password: password);
    emit(
      AuthLoggedIn(
        profile: Profile.fromMap(
          await Supabase.instance.client
              .from("Profiles")
              .select()
              .eq("user_id", Supabase.instance.client.auth.currentUser!.id)
              .single(),
        ),
      ),
    );
    final Session? session = res.session;
    if (session == null) {
      throw new Exception("Login Failed");
    }
  }

  Future<void> register(String email, String password) async {
    final supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    print(res);
    final Session? session = res.session;
    final User? user = res.user;
  }
}
