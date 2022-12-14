import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/screens/creatorpages/registerpages/register_page.dart';

import '../../firstpages/welcome_page.dart';
import '../loginpages/login_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/createAccount01.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Comece Agora Um\nAtendimento!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Encontre cuidadores qualificados a\nqualquer momento',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 70,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                // ignore: deprecated_member_use
                primary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: Text(
                'Crie Uma Conta',
                style: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: const Color.fromRGBO(0, 101, 156, 1),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 133, vertical: 20),
                side: const BorderSide(
                  color: Color.fromRGBO(0, 101, 156, 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Text(
                'Entrar',
                style: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: bottomCliqueAqui(),
    );
  }
}
