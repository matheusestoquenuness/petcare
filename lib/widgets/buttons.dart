import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget raised({
  Function ontap,
  Widget child,
}) {
  return SizedBox(
    height: 44,
    child: RaisedButton(
      disabledColor: Colors.blue.withOpacity(0.5),
      onPressed: ontap,
      child: Text(
        'Entrar',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue[900],
    ),
  );
}
