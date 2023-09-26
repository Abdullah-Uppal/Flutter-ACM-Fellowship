import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone_material/cubits/auth/auth_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {}, label: const Text("Create Account")),
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
                      onPressed: () async {
                        try {
                          await context.read<AuthCubit>().register(
                              emailController.text, passwordController.text);
                          Navigator.of(context).pushNamed("/home");
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Failed")));
                        }
                      },
                      child: const Text("Create"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
