import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../verify_pages/verify_pages.dart';
import '../cares_page.dart';

class BuildBodyCaresPage extends StatefulWidget {
  const BuildBodyCaresPage({Key? key}) : super(key: key);

  @override
  State<BuildBodyCaresPage> createState() => _BuildBodyCaresPageState();
}

String countryDial = "+55";

class _BuildBodyCaresPageState extends State<BuildBodyCaresPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),

            //nome
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresNameEditingController,
              keyboardType: TextInputType.name,
              validator: (value) {
                RegExp regex = RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("O campo nome completo não pode estar vazio");
                }
                if (!regex.hasMatch(value)) {
                  return ("Insira nome completo válido(Min. 3 Caracteres)");
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresNameEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Ex: João da Silva",
                labelText: 'Nome/sobrenome',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresLocationEditingController,
              keyboardType: TextInputType.name,
              validator: (value) {
                RegExp regex = RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("O campo endereço não pode estar vazio");
                }
                if (!regex.hasMatch(value)) {
                  return ("Insire um endereço válido(Min. 3 Caracteres)");
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresNameEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.map_outlined),
                hintText: "Ex: SBO, Vista Alegre",
                labelText: 'Cidade, Bairro',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //telefone
            IntlPhoneField(
              validator: (value) {
                if (value.toString().isEmpty) {
                  return ("O número de telefone não pode estar vazio");
                }
                return null;
              },
              controller: CaresInputs.caresTelefoneEditingController,
              showCountryFlag: false,
              showDropdownIcon: false,
              initialValue: countryDial,
              keyboardType: TextInputType.phone,
              onCountryChanged: (country) {
                setState(() {
                  countryDial = "+" + country.dialCode;
                });
              },
              decoration: const InputDecoration(
                counterText: "",
                prefixIcon: Icon(Icons.person),
                hintText: "(99) 99999-9999",
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //email
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Por favor, insire seu email");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Por favor, insira um email válido");
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresNameEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'E-mail',
                hintText: "nome@email.com",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //senha
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresPasswordController,
              obscureText: true,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Senha é necessária para o Registro");
                }
                if (!regex.hasMatch(value)) {
                  return ("Insira uma senha válida(Min. 6 Caracteres)");
                }
                return null;
              },
              onSaved: (senha) {
                CaresInputs.caresNameEditingController.text = senha!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_rounded),
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //senha dnv
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresConfirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (CaresInputs.caresConfirmPasswordController.text !=
                    CaresInputs.caresPasswordController.text) {
                  return "A senha não corresponde";
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresConfirmPasswordController.text = value!;
              },
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_rounded),
                labelText: "Confirme a senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 40,
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
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyPage(),
                  ),
                );
              },
              child: Text(
                'Criar Conta',
                style: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaresInputs {
  static TextEditingController caresNameEditingController =
      TextEditingController();
  static TextEditingController caresLocationEditingController =
      TextEditingController();
  static TextEditingController caresTelefoneEditingController =
      TextEditingController();
  static TextEditingController caresEmailController = TextEditingController();
  static TextEditingController caresPasswordController =
      TextEditingController();
  static TextEditingController caresConfirmPasswordController =
      TextEditingController();
  static TextEditingController caresTelefoneController =
      TextEditingController();
}
