import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'arrow.dart';

class ArrowButton extends StatelessWidget {
  final int type; //0 = txt, 1 = icon, 2 = img
  final String txt;
  final IconData icon;
  final String imgIcon;
  final String label;
  final int leftSize;
  final int rightSize;
  final double height;
  final double width;

  const ArrowButton({
    Key key,
    @required this.type,
    this.txt,
    this.icon,
    this.imgIcon,
    this.label,
    this.leftSize = 2,
    this.rightSize = 6,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    Widget iconLS;

    switch (type) {
      case 0:
        iconLS = Text(
          txt,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        );
        break;
      case 1:
        iconLS = Icon(icon);
        break;
      case 2:
        iconLS = CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenHeight),
            child: CachedNetworkImage(
              imageUrl: imgIcon,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        );

        break;
      default:
        iconLS = Text(
          txt,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: height,
      width: width,
      child: Material(
        color: Color(0XFFFAFAFA),
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenHeight * 0.012),
        ),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Color.fromRGBO(64, 196, 255, 0.2),
          onTap: () {},
          child: Row(
            children: <Widget>[
              Flexible(
                flex: leftSize,
                child: Stack(
                  children: <Widget>[
                    //Camada de fundo do bevel
                    Container(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 4,
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(screenHeight * 0.012),
                                    bottomLeft:
                                        Radius.circular(screenHeight * 0.012),
                                  )),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Arrow(),
                          ),
                        ],
                      ),
                    ),
                    //Camada frontal
                    Align(
                      alignment: Alignment.center,
                      child: iconLS,
                    )
                  ],
                ), //MbrClip(),
              ),
              Flexible(
                flex: rightSize,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: screenHeight * 0.015),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Quando o Brasil joga?',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: screenHeight * 0.02),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
