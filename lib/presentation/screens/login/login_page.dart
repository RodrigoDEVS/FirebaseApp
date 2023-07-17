import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/domain/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_app/domain/repository/login_repository.dart';
import 'package:flutter_bloc_app/domain/use_case/login_use_case.dart';
import 'package:flutter_bloc_app/presentation/screens/login/widgets/default_icon_button.dart';
import 'package:flutter_bloc_app/presentation/screens/register/register_page.dart';
import 'package:flutter_bloc_app/presentation/widgets/default_textformfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailEditingController;
  TextEditingController passwordEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
              child: Column(children: [
                const Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        defaultIconButton(() => print('google'), "google"),
                        defaultIconButton(() => print('apple'), "apple"),
                        defaultIconButton(() => print('facebook'), "facebook"),
                      ]),
                ),
                Text(
                  'o usa tu propia cuenta de email y contraseña',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email:"),
                        DefaultTextFormField(
                            hintText: "Email",
                            prefixIcon: Icons.email,
                            textEditingController: emailEditingController,
                            onChanged: (value) =>
                                bloc.add(EmailChanged(email: value))),
                        const SizedBox(height: 20),
                        const Text("Contraseña:"),
                        DefaultTextFormField(
                          hintText: "Contraseña",
                          prefixIcon: Icons.person,
                          suffixIcon: state.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: state.showPassword,
                          showPass: () => bloc.add(
                              ShowPassword(showPassword: !state.showPassword)),
                          textEditingController: passwordEditingController,
                          onChanged: (value) =>
                              bloc.add(PasswordChanged(password: value)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 50, bottom: 40),
                          child: SizedBox(
                            width: size.width * 0.8,
                            child: ElevatedButton(
                                onPressed: () {
                                  LoginUseCase(context).logIn('email');
                                },
                                child: const Text("Login")),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              print('olvidó la constraseña');
                            },
                            child: const Text(
                              'Olvidaste la contraseña?',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("No tienes una cuenta?"),
                              TextButton(
                                child: const Text("Regístrarse",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontStyle: FontStyle.italic)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(),
                                      ));
                                },
                              )
                            ]),
                      ]),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
