import 'package:flurs/home/home.dart';
import 'package:flurs/login/login_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  final _controllerUsername = TextEditingController();
  final _controllerPassword = TextEditingController();
  _navigateHome() {
    if (_key.currentState.validate()) {
      print(_controllerPassword.text);
      print(_controllerUsername.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  void dispose() {
    _controllerPassword.dispose();
    _controllerUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _key,
            child: Column(
              children: <Widget>[
                InputLogin(
                  controller: _controllerUsername,
                  isPassword: false,
                  label: "Username",
                ),
                InputLogin(
                  controller: _controllerPassword,
                  isPassword: true,
                  label: "Password",
                ),
              ],
            ),
          ),
          FlatButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Login'),
              onPressed: this._navigateHome),
        ],
      ),
    );
  }
}
