import 'package:flutter/material.dart';
import 'package:kalkulator/assets/CircleImage.dart';
import 'package:kalkulator/assets/TextName.dart';

class Profile extends StatelessWidget{
  static const routerName = "/Profile";

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [Colors.purpleAccent, Colors.lightGreenAccent]),
          image: DecorationImage(
            image: AssetImage("assets/images/pattern5.png"),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 60,
              top: 80,
              left: 0,
              right: 0,
              child: Card(
                margin: EdgeInsets.only(left: 16, right: 16),
                color: Colors.white.withOpacity(0.7),
                child: Container(
                  height: 500,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              top: 60,
              left: 0,
              right: 0,
              child: Card(
                margin: EdgeInsets.only(left: 25, right: 25),
                color: Colors.white,
                child: Container(
                  height: 500,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleImage(
                              img: "images/img.jpg",
                              width: 120,
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                      TextName("Sindy Ayu Lestari"),
                      Text("sindyayulestari69@gmail.com"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
