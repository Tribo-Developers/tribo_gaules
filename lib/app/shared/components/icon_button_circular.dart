import 'package:flutter/material.dart';

class IconButtonCircular extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double iconSize;
  final bool border;
  final double radius;
  final Function onTap;

  const IconButtonCircular({
    Key key,
    this.icon,
    this.color = Colors.transparent,
    this.iconColor = Colors.lightBlueAccent,
    this.iconSize,
    this.border = true,
    this.radius,
    this.onTap,
  }) : super(key: key);

  @override
  _IconButtonCircularState createState() => _IconButtonCircularState();
}

class _IconButtonCircularState extends State<IconButtonCircular> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight),
        border: Border.all(
          width: 1,
          color: widget.border ? Colors.lightBlueAccent : Colors.transparent,
        ),
      ),
      child: Material(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenHeight),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          borderRadius: BorderRadius.circular(screenHeight),
          highlightColor: Colors.transparent,
          splashColor: widget.color != Colors.lightBlueAccent
              ? Color.fromRGBO(64, 196, 255, 0.4)
              : Color.fromRGBO(255, 255, 255, 0.4),
          onTap: widget.onTap,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: widget.radius,
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
