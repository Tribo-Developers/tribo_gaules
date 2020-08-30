import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserStatus extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final String side;
  final Color bgColor;
  final Color txtColor;

  const UserStatus({
    Key key,
    this.img,
    this.title,
    this.subtitle,
    this.side = "left",
    this.bgColor = const Color(0XFFFAFAFA),
    this.txtColor = Colors.lightBlueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //Left Side
    Row leftSide = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.lightBlueAccent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height),
            child: CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(width: size.height * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: size.height * 0.013,
                color: txtColor,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.bold,
                color: txtColor,
              ),
            ),
          ],
        ),
        SizedBox(width: size.height * 0.04),
      ],
    );

    //Right Side
    Row rightSide = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: size.height * 0.04),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: size.height * 0.013,
                color: txtColor,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.bold,
                color: txtColor,
              ),
            ),
          ],
        ),
        SizedBox(width: size.height * 0.01),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.lightBlueAccent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height),
            child: CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(size.height))),
      padding: EdgeInsets.all(size.height * 0.005),
      child: side == "left" ? leftSide : rightSide,
    );
  }
}
