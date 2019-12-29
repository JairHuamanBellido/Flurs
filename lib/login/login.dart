import 'package:flurs/home/home.dart';
import 'package:flurs/login/login_input.dart';
import 'package:flurs/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  final _controllerUsername = TextEditingController();
  final _controllerPassword = TextEditingController();
  Future<http.Response> _navigateHome() async {

    final request = await http.post('http://192.168.1.9:3000/auth', body: {
      "username": _controllerUsername.text.toString(),
      "password": _controllerPassword.text.toString()
    });
    if (request.statusCode == 201) {
      print("Data validad");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      print("Credenciales invalidas");
    }
  }

  void _navigateRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
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
          FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            child: Text('Sign Up'),
            onPressed: this._navigateRegister,
          )
        ],
      ),
    );
  }
}
