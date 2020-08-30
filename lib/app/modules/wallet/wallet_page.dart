import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'components/wallet_bottom_sheet.dart';
import 'components/smooth_graph.dart';
import '../../shared/components/txt_button.dart';
import 'wallet_controller.dart';

class WalletPage extends StatefulWidget {
  final String title;
  const WalletPage({Key key, this.title = "Wallet"}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends ModularState<WalletPage, WalletController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    double currentPoints = 15248.76;
    double currentAddedPoints = 634.89;
    double up = (currentPoints / 15952.01) * 100;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    //centerTitle: true,
                    leading: IconButton(
                      icon: Icon(
                        MdiIcons.chevronLeft,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Text(
                      'Meus pontos',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          MdiIcons.trophy,
                          color: Color(0XFFDAA520),
                        ),
                        onPressed: () => Modular.link.pushNamed("/leaderboard"),
                      )
                    ],
                  ),

                  //Top of
                  Container(
                    color: Color(0XFFFAFAFA),
                    height: screenHeight * 0.5,
                    child: Stack(
                      children: <Widget>[
                        //Values
                        Container(
                          width: screenWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Gaupoints',
                                style: TextStyle(
                                  color: Color.fromRGBO(64, 196, 255, 0.4),
                                  fontSize: screenHeight * 0.03,
                                  // fontWeight: FontWeight.w600,
                                  fontFamily: "GoogleSans",
                                ),
                              ),
                              Text(
                                '\$ ${currentPoints.toStringAsFixed(2)}'
                                    .replaceAll(".", ","),
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: screenHeight * 0.06,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "GoogleSansBold",
                                ),
                              ),

                              //Last added (percent of up/down)
                              Text(
                                '\$ ${currentAddedPoints.toStringAsFixed(2)} ' +
                                    '(${up.toStringAsFixed(2)}%)',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.03,
                                  color:
                                      up > 0 ? Color(0XFF3ADA6B) : Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "GoogleSans",
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.2)
                            ],
                          ),
                        ),

                        //Background graph
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: screenHeight * 0.25,
                            width: screenWidth,
                            child: SmoothGraph(),
                          ),
                        ),

                        //Buttons
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.08,
                            ),
                            width: screenWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                //Deposit btn
                                TxtButton(
                                  width: screenHeight * 0.24,
                                  height: screenHeight * 0.08,
                                  title: 'Depósito',
                                  txtBold: true,
                                  zFactor: 1.5,
                                  onTap: () {},
                                ),
                                //Withdraw btn
                                TxtButton(
                                  width: screenHeight * 0.24,
                                  height: screenHeight * 0.08,
                                  title: 'Saque',
                                  txtBold: true,
                                  color: Colors.lightBlueAccent,
                                  txtColor: Colors.white,
                                  zFactor: 1.5,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //bottom side
              Positioned(
                bottom: 0,
                child: WalletBottomSheet(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
