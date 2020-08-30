import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WalletBottomSheet extends StatefulWidget {
  final int index;
  final ListView listViewComment;
  final Function onTap;

  WalletBottomSheet({
    Key key,
    this.index,
    this.listViewComment,
    this.onTap,
  }) : super(key: key);

  @override
  _WalletBottomSheetState createState() => _WalletBottomSheetState();
}

class _WalletBottomSheetState extends State<WalletBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
//      color: Color(0XFF737373),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: size.height * 0.42,
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
                color: Color.fromRGBO(64, 196, 255, 0.6),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.007,
              width: MediaQuery.of(context).size.width * 0.15,
            ), //itemSimbolScollable

            //Next items here...

            //Bottom SheetBar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Meu Bolso',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(size.height),
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(64, 196, 255, 0.2),
                        child: Icon(
                          MdiIcons.poll,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(64, 196, 255, 0.2),
                      child: Icon(
                        MdiIcons.cash,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Compra 0' + (index + 1).toString(),
                          style: TextStyle(
                            fontFamily: "GoogleSans",
                          ),
                        ),
                        Text(
                          '\$ 6125.20'.replaceAll(".", ","),
                          style: TextStyle(
                            fontFamily: "GoogleSans",
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$ 9456.00'.replaceAll(".", ","),
                          style: TextStyle(
                            fontFamily: "GoogleSans",
                          ),
                        ),
                        Text(
                          '\$ 0.7'.replaceAll(".", ","),
                          style: TextStyle(
                            fontFamily: "GoogleSans",
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
