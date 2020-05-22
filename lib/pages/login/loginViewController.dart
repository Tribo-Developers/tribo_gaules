import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'loginBuilder.dart';

class LoginPageState extends State<LoginBuilder>
    with SingleTickerProviderStateMixin {
  double screenHeight = 0;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, widget) {
            return buildStack();
          }),
    );
  }

  Widget buildStack() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    bool _rememberLogin = true;

    return Container(
      child: Column(
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
              onPressed: () {},
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.twitch,
                    color: Color(0xFF00CEFF),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Faça login através da Twitch',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF00CEFF),
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
                    activeColor: Color(0xFF00CEFF),
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
                    color: Color(0xFF00CEFF),
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
