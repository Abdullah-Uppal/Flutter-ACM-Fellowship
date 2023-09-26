import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:twitter_clone_material/cubits/auth/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    supabase.Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      if (!event.session!.isExpired) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed('/signup');
          },
          label: const Text("Create Account")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  label: const Text("Email"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  label: const Text("Password"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return FilledButton(
                      onPressed: () {
                        try {
                          context
                              .read<AuthCubit>()
                              .login(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            Navigator.of(context).pushReplacementNamed("/home");
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login Failed")));
                        }
                      },
                      child: Text("Login"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
