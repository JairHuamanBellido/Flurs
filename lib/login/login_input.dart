import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  InputLogin({Key key, this.controller, this.label, this.isPassword = false})
      : super(key: key);

  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: widget.isPassword,
        controller: widget.controller,
        decoration: InputDecoration(hintText: widget.label),
      ),
    );
  }
}
