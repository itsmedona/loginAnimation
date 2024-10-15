import 'package:flutter/material.dart';

import 'view/loginpage/loginpage.dart';

void main() {
  runApp(loginAni());
}
class loginAni extends StatelessWidget {
  const loginAni({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}