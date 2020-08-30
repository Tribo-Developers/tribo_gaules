import 'package:flutter/material.dart';

class BoxMsgSend extends StatefulWidget {
  BoxMsgSend({
    Key key,
    this.txtMsg,
    this.getImgBtn,
    this.sendMsgBtn,
  }) : super(key: key);
  final TextField txtMsg;
  final Widget getImgBtn;
  final Widget sendMsgBtn;

  @override
  _BoxMsgSendState createState() => _BoxMsgSendState();
}

class _BoxMsgSendState extends State<BoxMsgSend> {
  //_enviarMensagem() {}

  @override
  Widget build(BuildContext context) {
//    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            height: 69.0,
//            decoration: BoxDecoration(
//              border: Border(
//                bottom: BorderSide(
//                  width: 0.3,
//                  color: Colors.lightBlueAccent,
//                ),
//                top: BorderSide(
//                  width: 0.3,
//                  color: Colors.lightBlueAccent,
//                ), //Color(0xFFCCCCCC)),
//              ),
//            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    child: widget.txtMsg,
                  ),
                ), //TextBox
                Expanded(
                  flex: 1,
                  child: widget.getImgBtn,
                ), //Icon01
                Expanded(
                  flex: 1,
                  child: widget.sendMsgBtn,
                ), //Icon02
              ],
            ),
          ),
        ) //ContainBoxMsgSend
      ],
    );
  }
}
