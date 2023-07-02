import 'package:flutter/cupertino.dart';

Widget defaultIconButton(Function function, String iconName) {
  return GestureDetector(
    onTap: () => function(),
    child: SizedBox(
      height: 40,
      width: 40,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}
