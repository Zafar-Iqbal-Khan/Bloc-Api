import 'package:api_bloc/bloc/auth/bloc/auth_bloc.dart';
import 'package:api_bloc/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  var _password = "";
  var _username = "";
  AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              key: const Key('loginForm_usernameInput_textField'),
              controller: username,
              onChanged: (username) {
                setState(() {
                  _username = username;
                });
              },
              decoration: const InputDecoration(
                labelText: "username",
              ),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            TextField(
              key: const Key('loginForm_passwordInput_textField'),
              controller: password,
              onChanged: (password) {
                setState(() {
                  _password = password;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "password",
              ),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _username.length > 3 && _password.length > 3
                    ? const Color(0xffbe191f)
                    : const Color(0xffbe191f)
                        .withOpacity(0.3), // background (button) color
                foregroundColor: const Color.fromARGB(
                    255, 252, 248, 248), // foreground (text) color
              ),
              key: const Key('loginForm_continue_raisedButton'),
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const HomePage()));
                if (username.text.length > 3 && password.text.length > 3) {
                  authBloc.add(LoginEvent(
                      username: username.text, password: password.text));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter username and password"),
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocProvider(
                    create: (context) => authBloc,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoadedState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Auth Success, Welcome!",
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        } else if (state is AuthErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Auth Failed",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return Row(
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: const CircularProgressIndicator(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return const Text("login");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
