import 'package:flutter/material.dart';

class TxtButton extends StatefulWidget {
  final String title;
  final bool txtBold;
  final Function onTap;
  final double height;
  final double width;
  final Color color;
  final Color txtColor;
  final double zFactor;

  TxtButton({
    Key key,
    this.title,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.txtColor = Colors.lightBlueAccent,
    this.zFactor = 1,
    this.txtBold = false,
  }) : super(key: key);

  @override
  _TxtButtonState createState() => _TxtButtonState();
}

class _TxtButtonState extends State<TxtButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: widget.height,
      width: widget.width,
      child: Material(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        color: widget.color,
        borderRadius: BorderRadius.all(Radius.circular(size.height * 0.02)),
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.height * 0.02,
              size.height * 0.01,
              size.height * 0.02,
              size.height * 0.01,
            ),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.txtColor,
                  letterSpacing: 0.5,
                  fontSize: size.height * 0.02 * widget.zFactor,
                  fontWeight:
                      widget.txtBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
