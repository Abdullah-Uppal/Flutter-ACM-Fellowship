import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app_bloc/logic/login_cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccessful) {
          context.pushReplacement("/");
        } else if (state is LoginFailed) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Failed"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 40,
                        ),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        context.read<LoginCubit>().login();
                      },
                      icon: Image.asset(
                        "assets/images/google.png",
                        height: 40,
                      ),
                      label: const Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 1,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  return const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    height: 1,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
