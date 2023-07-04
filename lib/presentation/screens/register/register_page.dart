import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/domain/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_bloc_app/domain/repository/register_repository.dart';
import 'package:flutter_bloc_app/presentation/widgets/default_textformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final bloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(body:
        BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Column(children: [
            const Text(
              "Nuevo Registro",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                          bloc.add(EmailChanged(email: value)),
                    ),
                    const SizedBox(height: 20),
                    const Text("Contraseña:"),
                    DefaultTextFormField(
                      hintText: "Contraseña",
                      prefixIcon: Icons.person,
                      suffixIcon: state.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscureText: state.showPassword,
                      showPass: () {
                        bloc.add(
                            ShowPassword(showPassword: state.showPassword));
                      },
                      textEditingController: passwordEditingController,
                      onChanged: (value) =>
                          bloc.add(PasswordChanged(password: value)),
                    ),
                    const SizedBox(height: 20),
                    const Text("Confirmar Contraseña:"),
                    DefaultTextFormField(
                      hintText: "Contraseña",
                      prefixIcon: Icons.person,
                      suffixIcon: state.showConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscureText: state.showConfirmPassword,
                      showPass: () {
                        bloc.add(ShowConfirmPassword(
                            showConfirmPassword: state.showConfirmPassword));
                      },
                      textEditingController: confirmPasswordEditingController,
                      onChanged: (value) => bloc
                          .add(ConfirmPasswordChanged(confirmPassword: value)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 50, bottom: 10),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: ElevatedButton(
                            onPressed: () {
                              print('email: ${state.email}');
                              print('contraseña: ${state.password}');
                              print(
                                  'Contraseña Registrada: ${state.confirmPassword}');
                              RegisterRepository(context: context)
                                  .handleRegister();
                            },
                            child: const Text("Registrarse")),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey[300])),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.green[900]),
                            )),
                      ),
                    ),
                  ]),
            )
          ]),
        ),
      );
    }));
  }
}
