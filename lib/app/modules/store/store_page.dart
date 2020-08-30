import 'package:Triboneira/app/shared/utils/constants.dart';
import 'package:Triboneira/app/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../shared/components/icon_button_circular.dart';
import 'store_controller.dart';
import 'dart:math' as math;

class StorePage extends StatefulWidget {
  final String title;
  const StorePage({Key key, this.title = "Store"}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends ModularState<StorePage, StoreController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    List<IconData> ico = [
      MdiIcons.infinity,
      MdiIcons.bullseyeArrow,
      MdiIcons.volumeHigh,
      MdiIcons.qrcode
    ];
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
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
              'TriboStore',
              style: TextStyle(
                color: Colors.lightBlueAccent,
              ),
            ),
            //centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  MdiIcons.magnify,
                  color: Colors.lightBlueAccent,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.heart,
                  color: Colors.lightBlueAccent,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.cart,
                  color: Colors.lightBlueAccent,
                ),
                onPressed: () {},
              ),
            ],
          ),

          //Horizontal List
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenHeight * 0.02,
              vertical: screenHeight * 0.02,
            ),
            height: screenHeight * 0.09,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: ico.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenHeight * 0.02,
                          ),
                          child: IconButtonCircular(
                            icon: ico[index],
                            iconSize: screenHeight * 0.05,
                            color: Colors.lightBlueAccent,
                            iconColor: Colors.white,
                            radius: screenHeight * 0.045,
                            onTap: () {},
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenHeight * 0.02,
                          ),
                          child: IconButtonCircular(
                            icon: ico[index],
                            iconSize: screenHeight * 0.05,
                            radius: screenHeight * 0.045,
                            onTap: () {},
                          ),
                        );
                }),
          ),
          //Gridview
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  physics: BouncingScrollPhysics(),
                  itemCount: 6,
                  // shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (2 / 3.5),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightBlueColor,
                        child: InkWell(
                          onTap: () => Modular.link.pushNamed("/item_details"),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                          icon: Icon(
                                            index % 2 == 0
                                                ? MdiIcons.heartOutline
                                                : MdiIcons.heart,
                                            color: AppColors.blueColor,
                                            size: 20,
                                          ),
                                          onPressed: null),
                                    )),
                                Flexible(
                                    flex: 4,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Container(
                                              margin: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Transform.rotate(
                                          angle: math.pi / 4,
                                          child: showImage(
                                            "https://i.imgur.com/GI1TjLc.png",
                                          ),
                                        )
                                      ],
                                    )),
                                Flexible(
                                    flex: 2,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "AK-47|Asiimov",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "GoogleSans",
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "\$ 142056",
                                            style: TextStyle(
                                              fontFamily: "GoogleSans",
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
