import 'package:Triboneira/app/shared/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'components/arrow_button.dart';
import 'components/img_button.dart';
import 'components/my_bottom_sheet.dart';
import 'components/user_status.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final List<String> imgList = [
  'https://i.imgur.com/x74Fhlf.jpg',
  'https://i.imgur.com/4zqbNhk.png',
];

class _HomePageState extends ModularState<HomePage, HomeController> {
  int _current = 0;

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.blueColor));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        icon: Icon(
                          MdiIcons.wallet,
                          color: Colors.lightBlueAccent,
                        ),
                        onPressed: () => Modular.to.pushNamed("/wallet")),
                  )
                ],
              ),

              //User-Status widgets
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //User
                    UserStatus(
                      img: 'https://i.imgur.com/dAEM5HA.png',
                      title: 'Logado como',
                      subtitle: 'Maxweel',
                    ),

                    //Status
                    UserStatus(
                      img: 'https://i.imgur.com/nUDXBTl.png',
                      title: 'Estamos',
                      subtitle: 'Ao vivo',
                      side: 'right',
                      bgColor: Colors.lightBlueAccent,
                      txtColor: Colors.white,
                    ),
                  ],
                ),
              ),

              //Button
              ArrowButton(
                type: 0,
                txt: 'mbr',
                height: screenHeight * 0.05,
                width: double.infinity,
              ),

              //Banner title
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Rolando agora na live',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              //Banner
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenHeight * 0.015),
                  child: CachedNetworkImage(
                    imageUrl: "https://i.imgur.com/x74Fhlf.jpg",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),

              //Rivals
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    //Separator
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.lightBlueAccent,
                        height: 30,
                        width: screenWidth * 0.8,
                      ),
                    ),

                    //X
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    //Btn Time01
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ImgButton(
                        width: screenWidth * 0.4,
                        imgUrl: "https://i.imgur.com/IEg8Wqn.png",
                        action: "Aposte na",
                        title: "Astralis.gg",
                      ),
                    ),

                    //Btn Time02
                    Align(
                      alignment: Alignment.centerRight,
                      child: ImgButton(
                        width: screenWidth * 0.4,
                        side: "right",
                        imgUrl: "https://i.imgur.com/NVKOQ3C.png",
                        action: "Aposte na",
                        title: "Team Spirit",
                      ),
                    ),
                  ],
                ),
              ),

              //Msg live
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Mande uma mensagem na live',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),

              //Interactions Buttons
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Contact us
                    Flexible(
                      flex: 10,
                      child: ImgButton(
                        onTap: () {
                          print('Entrou no button');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => MyBottomSheet(
                              onTap: () {
                                print('Send msg to chat');
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        imgUrl: "https://i.imgur.com/CgnlHfb.png",
                        action: "Fale com o",
                        title: "Gaules",
                        zFactor: 1.4,
                      ),
                    ),

                    SizedBox(width: screenHeight * 0.01),

                    //Shop
                    Flexible(
                      flex: 10,
                      child: ImgButton(
                        onTap: () => Modular.to.pushNamed("/store"),
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        side: "right",
                        imgUrl: "https://i.imgur.com/0IKZqTE.png",
                        action: "Demais opções",
                        title: "TriboStore",
                        zFactor: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              //Agenda nxt games text
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Confira a agenda dos próximos jogos',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),

              //ImageSlider
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(64, 196, 255, 0.9)
                          : Color.fromRGBO(64, 196, 255, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //ImageSlide configs
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}
