import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/helpers/validators.dart';

Widget fildLogin({
  TextEditingController controller,
  String hint = '',
  TextInputType inputType,
  bool obscure = false,
  Function iconButton,
  bool enable = true,
}) {
  return TextFormField(
    enabled: enable,
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
    ),
    autocorrect: false,
    keyboardType: inputType,
    obscureText: obscure,
    validator: (val) {
      if (val.isEmpty) {
        return 'Senha inválida';
      }
    },
  );
}

Widget fildEmail({
  TextEditingController controller,
  String hint = '',
  TextInputType inputType,
  bool obscure = false,
  Function validator,
  bool enable,
}) {
  return TextFormField(
    enabled: enable = true,
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
    ),
    autocorrect: false,
    keyboardType: inputType,
    obscureText: obscure,
    validator: (email) {
      if (!validaEmail(email)) {
        return 'Email inválido';
      }
    },
  );
}
