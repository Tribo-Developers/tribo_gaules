import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImgButton extends StatefulWidget {
  final String imgUrl;
  final String action;
  final String title;
  final String side; //You need to select between left or right.
  final Function onTap;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final double zFactor;

  ImgButton({
    Key key,
    this.imgUrl,
    this.action,
    this.title,
    this.side = "left",
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.textColor = Colors.lightBlueAccent,
    this.zFactor = 1,
  }) : super(key: key);

  @override
  _ImgButtonState createState() => _ImgButtonState();
}

class _ImgButtonState extends State<ImgButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //LeftSide
    Row rowLeft = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 15 * widget.zFactor,
          child: CachedNetworkImage(
            imageUrl: widget.imgUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.action,
              style: TextStyle(
                color: widget.textColor,
                fontSize: size.height * 0.012 * widget.zFactor,
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.textColor,
                letterSpacing: 0.5,
                fontSize: size.height * 0.018  * widget.zFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );

    //RightSide
    Row rowRight = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              widget.action,
              style: TextStyle(
                color: widget.textColor,
                fontSize: size.height * 0.012  * widget.zFactor,
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.textColor,
                letterSpacing: 0.5,
                fontSize: size.height * 0.018  * widget.zFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 15 * widget.zFactor,
          child: CachedNetworkImage(
            imageUrl: widget.imgUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );

    return Container(
      height: widget.height,
      width: widget.width,
      child: Material(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        color: widget.color,
        borderRadius:
        BorderRadius.all(Radius.circular(10.0)),
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.height * 0.02,
              size.height * 0.01,
              size.height * 0.02,
              size.height * 0.01,
            ),
            child: widget.side == "right" ? rowRight : rowLeft,
          ),
        ),
      ),
    );
  }
}
