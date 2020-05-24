import 'package:Triboneira/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  bool _rememberLogin = true;
  String _status = '';

  void oauthTwitch() async {
    final url = 'http://localhost:3000/auth/twitch';
    final callbackUrlScheme = 'tribogaules://';

    try {
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: callbackUrlScheme);
      setState(() {
        _status = 'Got result: $result';
        print(_status);
      });
    } on PlatformException catch (e) {
      setState(() {
        _status = 'Got error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: _height / 3,
            width: _width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_login.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7.0,
                  spreadRadius: 2,
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/LOGO-G-POSITIVO.png',
              height: 30,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Seja bem-vindo,",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontFamily: 'Draft B',
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                      fontFamily: 'Draft B',
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Ao app da "),
                      TextSpan(
                        text: "TRIBO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 50.0,
                  spreadRadius: -30,
                  offset: Offset(
                    10.0,
                    10.0,
                  ),
                )
              ],
            ),
            width: _width / 1.2,
            child: RaisedButton(
              onPressed: oauthTwitch,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.twitch,
                    color: blueColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Faça login através da Twitch',
                    style: TextStyle(
                      fontSize: 16,
                      color: blueColor,
                      fontFamily: 'Draft B',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 35.0,
                  height: 45.0,
                  child: Checkbox(
                    tristate: false,
                    activeColor: blueColor,
                    value: _rememberLogin,
                    onChanged: (bool value) {
                      setState(
                        () {
                          _rememberLogin = value;
                        },
                      );
                    },
                  ),
                ),
                Text(
                  "Lembrar o meu login",
                  style: TextStyle(
                    fontFamily: "Draft B",
                    fontSize: 14,
                    color: blueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
