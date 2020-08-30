import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'item_details_controller.dart';
import '../../../../shared/components/icon_button_circular.dart';
import '../../../../shared/components/txt_button.dart';
import 'dart:math' as math;

class ItemDetailsPage extends StatefulWidget {
  final String title;
  const ItemDetailsPage({Key key, this.title = "ItemDetails"})
      : super(key: key);

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState
    extends ModularState<ItemDetailsPage, ItemDetailsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    //Variables
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    bool isFavorite = false;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //bgBlueItem
                Stack(
                  children: <Widget>[
                    Container(
                      height: screenHeight * 0.60,
                      width: screenWidth,
                      color: Color.fromRGBO(64, 196, 255, 0.3),
                    ),

                    //bgCircle
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.15),
                        height: screenHeight * 0.35,
                        width: screenHeight * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenHeight),
                        ),
                      ),
                    ),

                    //Weapon
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.1),
                        height: screenHeight * 0.45,
                        width: screenHeight * 0.45,
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: CachedNetworkImage(
                            imageUrl: 'https://i.imgur.com/GI1TjLc.png',
                            //imageUrl: 'https://i.imgur.com/XkU13Zh.png',
                            //imageUrl: 'https://i.imgur.com/s6zmmXk.png',
                            //imageUrl: 'https://i.imgur.com/hCN9nLW.png',
                          ),
                        ),
                      ),
                    ),

                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
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
                        'AK-47 | Asiimov',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      //centerTitle: true,
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(
                            MdiIcons.cart,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.04),
                  child: Column(
                    children: <Widget>[
                      //Row name price
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'AK-47 | Asiimov',
                              style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                            Text(
                              '\$ 142056',
                              style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontFamily: "GoogleSans",
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Row State
                      Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Estado: Field Tested',
                              style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontFamily: "GoogleSans",
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Row description
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Get answers, play songs, tackle your day, enjoy your entertainment and control your smart ...',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: screenHeight * 0.02,
                                fontFamily: "GoogleSans",
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Spacer to don't stay behind buttons
                SizedBox(height: screenHeight * 0.11),

                //Banner image
                //Image(image: NetworkImage('https://i.imgur.com/ojPZWSx.png'),),
              ],
            ),
          ),

          //Cart-favorite items
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenHeight * 0.04,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Favorite button
                  IconButtonCircular(
                    //Verifica se o item ja faz faz parte dos favoritos
                    icon: !isFavorite ? MdiIcons.heartOutline : MdiIcons.heart,
                    radius: screenHeight * 0.035,
                  ),
                  //Add to cart button
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: screenHeight * 0.3,
                      maxWidth: screenHeight * 0.35,
                    ),
                    child: TxtButton(
                      title: 'Adicionar ao carrinho'.toUpperCase(),
                      height: screenHeight * 0.07,
                      color: Colors.lightBlueAccent,
                      txtColor: Colors.white,
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
