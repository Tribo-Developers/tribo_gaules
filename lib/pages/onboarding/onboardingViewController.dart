import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboardingBuilder.dart';

class OnboardingPageState extends State<OnboardingBuilder>
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
            }));
  }

  Widget buildStack() {
    return Container();
  }
}
