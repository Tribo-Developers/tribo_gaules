import 'package:Triboneira/config/sizeConfig.dart';
import 'package:Triboneira/static/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:Triboneira/pages/splash/splashBuilder.dart';

class SpashViewController extends State<SplashBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Expanded(
              child: Align(
                  alignment: Alignment.center, child: WelcomeContentWidget()),
            )));
  }
}

class WelcomeContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    child: Text(
                      Strings.welcomeScreenTitle,
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 1 * SizeConfig.heightMultiplier),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 2 * SizeConfig.heightMultiplier),
                  child: Text(
                    Strings.welcomeScreenSubTitle,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
