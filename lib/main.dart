import 'package:flutter/material.dart';
import 'package:Triboneira/routes/routes.dart';

import 'config/sizeConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            title: 'Triboneira',
            debugShowCheckedModeBanner: false,
            routes: routes,
            theme: ThemeData(unselectedWidgetColor: Color(0xFF00CEFF)),
          );
        },
      );
    });
  }
}
