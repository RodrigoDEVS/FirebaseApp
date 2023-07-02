import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/domain/bloc/welcome_bloc/welcome_bloc.dart';

import '../login/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    BlocProvider.of<WelcomeBloc>(context)
                        .add(ChangePage(index: value));
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "Siguiente",
                        "Aprender",
                        "Texto explicativo: bienvenido a nuestra aplicación flutter bloc app, aquí podras entregar el uso del patrón BLoC.",
                        "assets/images/reading.png",
                        size),
                    _page(
                        2,
                        context,
                        "Siguiente",
                        "Conecta con Todo el Mundo",
                        "Permanece en contacto con tu tutor y amigos, ¡Conectate!",
                        "assets/images/boy.png",
                        size),
                    _page(
                        3,
                        context,
                        "Empezar",
                        "Aprende con Entusiasmo",
                        "Donde sea, a cualquier hora. El tiempo es a tu discreción, así que estudia cuando quieras.",
                        "assets/images/man.png",
                        size),
                  ],
                ),
                Positioned(
                    bottom: 100,
                    child: DotsIndicator(
                        decorator: DotsDecorator(
                          activeSize: const Size(18, 10),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        position: state.index.toDouble(),
                        dotsCount: 3))
              ],
            ),
          );
        },
      ),
    );
  }

  Column _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath, Size size) {
    return Column(
      children: [
        SizedBox(
          child: Image.asset(imagePath),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.1),
          width: size.width * 0.8,
          child: ElevatedButton(
            onPressed: () {
              if (index < 3) {
                _pageController.nextPage(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
                );
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false);
              }
            },
            child: Text(buttonName),
          ),
        )
      ],
    );
  }
}
