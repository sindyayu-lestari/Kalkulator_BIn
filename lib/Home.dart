import 'package:flutter/material.dart';
import 'package:kalkulator/Profile.dart';
import 'package:kalkulator/assets/ItemNumber.dart';
import 'package:kalkulator/assets/RadioButton.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";

  @override
  _Home createState() => _Home();
}
class _Home extends State <Home> {
  var key = TextEditingController( );
  @override
  void initState() {
    key.addListener( () {
      if (key.text.length > 0) {
        setState( () {
          if (bin == 0) {
            toBin();
          } else {
            if (okt == 1) {
              toOkt();
            }else {
              if (desi == 2) {
                toDesi();
              }else {
                if (hex == 3) {
                  toHex();
                }
              }
            }
          }
        });
      }
    });
    super.initState( );
  }

  @override
  void dispose(){
    key.dispose( );
    super.dispose( );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( "Kalkulator" ),
          actions: <Widget>[
            IconButton(
              icon: Icon( Icons.person_pin),
              onPressed: () => Navigator.pushNamed( context, Profile.routerName ),
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [Colors.purpleAccent, Colors.lightGreenAccent]),
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
                fit: BoxFit.none,
                image: AssetImage( "images/img3.png" ),
              ),
            ),
          ),
        ),
        body: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column( children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RadioButton(
                              name: "Biner",
                              value: 0,
                              groupValue: bin,
                              onChanged: changeBin,
                            ),
                            RadioButton(
                              name: "Oktal",
                              value: 1,
                              groupValue: okt,
                              onChanged: changeOkt,
                            ),
                            RadioButton(
                              name: "Desimal",
                              value: 2,
                              groupValue: desi,
                              onChanged: changeDesi,
                            ),
                            RadioButton(
                              name: "Hexa",
                              value: 3,
                              onChanged: changeHex,
                              groupValue: hex,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                                  controller: key,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Input...........",
                                    labelText: "Enter your Number!!...",
                                    suffixIcon: IconButton(
                                      onPressed: () => key.clear(),
                                      icon: Icon(Icons.cancel),
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ItemNumber(
                          "Biner :",
                          margin: EdgeInsets.only(left: 15),
                          value: binV,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                          height: 1,
                          color: Colors.black,
                        ),
                        ItemNumber(
                          "Oktal :",
                          value: oktV,
                          margin: EdgeInsets.only( top: 15, left: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                          height: 1,
                          color: Colors.black,
                        ),
                        ItemNumber(
                          "Desimal :",
                          value: desiV,
                          margin: EdgeInsets.only( top: 15, left: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                          height: 1,
                          color: Colors.black,
                        ),
                        ItemNumber(
                          "Hexa :",
                          value: hexV,
                          margin: EdgeInsets.only( top: 15, left: 15 ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                                color: Theme.of(context).accentColor,
                                textColor: Colors.white,
                                child: Text('Reset'),
                                onPressed: (){
                                  setState(() {
                                    _reset();});}
                            ),
                          ],
                        )
                      ],
                      ),
                    ]
                ),
              )
            ]
        )
    );
  }

  var bin = -1;
  var okt = -1;
  var desi = 1;
  var hex = -1;

  var binV = "";
  String oktV = "";
  String desiV = "";
  String hexV = "";

  void changeBin(int value) {
    setState( () {
      bin = value;
      okt = -1;
      desi = -1;
      hex = -1;
    } );
  }

  void changeOkt(int value) {
    setState( () {
      okt = value;
      bin = -1;
      desi = -1;
      hex = -1;
    } );
  }

  void changeDesi(int value) {
    setState( () {
      desi = value;
      okt = -1;
      bin = -1;
      hex = -1;
    } );
  }
  void changeHex(int value){
    setState(() {
      hex = value;
      okt = -1;
      desi = -1;
      bin = -1;
    });
  }
  void toBin() {
    BigInt inp = BigInt.parse(key.text.toString(), radix: 2);
    binV = inp.toRadixString(2);
    oktV = inp.toRadixString(8);
    desiV = inp.toRadixString(10);
    hexV = inp.toRadixString(16);
  }
  void toOkt() {
    BigInt inp = BigInt.parse(key.text.toString(), radix: 8);
    binV = inp.toRadixString(2);
    oktV = inp.toRadixString(8);
    desiV = inp.toRadixString(10);
    hexV = inp.toRadixString(16);
  }
  void toDesi() {
    BigInt inp = BigInt.parse(key.text.toString());
    binV = inp.toRadixString(2);
    oktV = inp.toRadixString(8);
    desiV = inp.toRadixString(10);
    hexV = inp.toRadixString(16);
    print(inp.toRadixString(2));
  }

  void toHex() {
    BigInt inp = BigInt.parse(key.text.toString(), radix: 16);
    binV = inp.toRadixString(2);
    oktV = inp.toRadixString(8);
    desiV = inp.toRadixString(10);
    hexV = inp.toRadixString(16);
  }
  void _reset() {
    key.text = "";
    binV = "";
    oktV = "";
    desiV = "";
    hexV = "";
  }
}