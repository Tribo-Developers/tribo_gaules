import 'package:Triboneira/app/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'box_msg_send.dart';

class MyBottomSheet extends StatefulWidget {
  final int index;
  final ListView listViewComment;
  final Function onTap;

  MyBottomSheet({
    Key key,
    this.index,
    this.listViewComment,
    this.onTap,
  }) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Color(0XFF737373),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor, //Color(0XFFFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).viewInsets.bottom + size.height * 0.17,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0151,
                bottom: MediaQuery.of(context).size.height * 0.0151,
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent, //Color(0XFFCCCCCC),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.007,
              width: MediaQuery.of(context).size.width * 0.15,
            ), //itemSimbolScollable
            BoxMsgSend(
              txtMsg: TextField(
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                ),
                cursorColor: Colors.lightBlueAccent,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Digite uma mensagem ',
                  hintStyle: TextStyle(color: Color(0XFFCCCCCC)),
                ),
                maxLines: null,
                autofocus: true,
                keyboardType: TextInputType.text,
              ),
              getImgBtn: IconButton(
                icon: Icon(
                  MdiIcons.imageOutline,
                  size: 30,
                  color: Color(0XFFCCCCCC),
                ),
                onPressed: () {},
              ),
              sendMsgBtn: Material(
                // needed
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(64, 196, 255, 0.4),
                  onTap: widget.onTap, // needed
                  borderRadius: BorderRadius.circular(size.height),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.lightBlueAccent, BlendMode.srcATop),
                    child: Image.asset(
                      "assets/images/gaules.png",
                      width: 22,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
