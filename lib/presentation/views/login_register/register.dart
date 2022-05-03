import 'package:fortloom/core/framework/colors.dart';
import 'package:fortloom/core/framework/globals.dart';
import 'package:fortloom/presentation/views/initScreen.dart';
import 'package:fortloom/presentation/widgets/buttonLarge.dart';
import 'package:fortloom/presentation/widgets/textForm.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final String typeRegister;
  Register({required this.typeRegister});

  @override
  Widget build(BuildContext context) {
    // String password = '';
    txtForm _txtFormemail = txtForm(
      title: 'Email',
      controller: _emailController,
      inputType: InputType.Email,
      txtColor: Colors.white,
    );
    txtForm _txtFormpasssword = txtForm(
      title: 'Password',
      controller: _passwordController,
      inputType: InputType.Password,
      txtColor: Colors.white,
    );
    txtForm _txtFormusername = txtForm(
      title: 'Username',
      controller: _usernameController,
      inputType: InputType.Default,
      txtColor: Colors.white,
    );

    return Scaffold(
      backgroundColor: background1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Image.asset('assets/imgs/logo.png',
                    height: ScreenWH(context).height * 0.3,
                    width: ScreenWH(context).width * 0.7)),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: _txtFormusername),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: _txtFormpasssword),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: _txtFormemail),
            ButtonLarge(
                text: 'Register $typeRegister',
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: InitScreen(),
                          type: PageTransitionType.rightToLeft));
                }),
          ],
        ),
      ),
    );
  }
}
