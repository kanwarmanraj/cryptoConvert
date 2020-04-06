import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bitcoin/coin.dart';
import 'package:bitcoin/currency_icon.dart';
import 'package:bitcoin/constants.dart';

CurrencyIcon icon = CurrencyIcon();

String selectedCurrency = 'USD';
String selectedCryptoCurrency = 'BTC';
String bitcoinEquation = '0';
String currencyEquation = '0';


var oneCryptoInCurr=7124.73;

Color color1 = mainColor;
Color color2 = Colors.black;
//Color mainColor=Colors.blueAccent;
int flag = 0;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void getData()async{




  }

  void updateUI(String text) {
    setState(() {



      if (flag == 0) {
        if (text == '.') {
          currencyEquation = currencyEquation + text;
        } else if (text == '⌫') {
          currencyEquation =
              currencyEquation.substring(0, currencyEquation.length - 1);
          var convertCurrency=double.parse(currencyEquation);

          var result=convertCurrency*oneCryptoInCurr;
          bitcoinEquation=result.toStringAsFixed(2);
        } else {
          if (currencyEquation == '0') {
             currencyEquation = text;
            var convertCurrency=double.parse(currencyEquation);

            var result=convertCurrency/oneCryptoInCurr;
            bitcoinEquation=result.toStringAsFixed(2);

          } else {
            setState(() {
              currencyEquation = currencyEquation + text;
              var convertCurrency=double.parse(currencyEquation);

              var result=convertCurrency/oneCryptoInCurr;
              bitcoinEquation=result.toStringAsFixed(2);
            });




          }
        }
      } else if (flag == 1) {
        if (text == '.') {
          bitcoinEquation = bitcoinEquation + text;

        } else if (text == '⌫') {
          bitcoinEquation =
              bitcoinEquation.substring(0, bitcoinEquation.length - 1);
        } else {
          if (bitcoinEquation == '0') {
            bitcoinEquation = text;
            var convertbitcoin=double.parse(bitcoinEquation);

            var result=convertbitcoin*oneCryptoInCurr;
            currencyEquation=result.toStringAsFixed(2);


          } else {
            bitcoinEquation = bitcoinEquation + text;
            var convertbitcoin=double.parse(bitcoinEquation);

            var result=convertbitcoin*oneCryptoInCurr;
            currencyEquation=result.toStringAsFixed(2);

          }
        }
      }
    });
  }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context)
  {
    setState(() {
      getData();

    });

    getDropDownItems();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: <Widget>[
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'images/background_orange.png',
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white,
                    ],
                    stops: [
                      0.0,
                      0.5
                    ])),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Text(
                    'Bitcoin converter',
                    style: TextStyle(
                      fontSize: 45,
                       fontWeight: FontWeight.bold,
                      wordSpacing: double.infinity,
                      height: 0.8,
                      fontFamily: 'Orbitron',
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        color1 = mainColor;
                        color2 = Colors.black;
                        flag = 0;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'selected currency',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  DropdownButton<String>(
                                      value: selectedCurrency,
                                      items: getDropDownItems(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCurrency = value;
                                          bitcoinEquation = '0';
                                          currencyEquation = '0';
                                        });
                                      }),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currencyEquation = '0';
                                          bitcoinEquation = '0';
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:05.0),
                                      child: Text(
                                        currencyEquation,
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),

                                      ),
                                    ),


                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: icon.getCurrencyIcon(selectedCurrency),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 2.2,
                                width: 400,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        color2 = mainColor;
                        color1 = Colors.black;
                        flag = 1;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'selected currency',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  DropdownButton<String>(
                                      value: selectedCryptoCurrency,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('BTC'),
                                          value: 'BTC',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('ETH'),
                                          value: 'ETH',
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCryptoCurrency = value;
                                           bitcoinEquation = '0';
                                           currencyEquation = '0';


                                        });
                                      }),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currencyEquation = '0';
                                          bitcoinEquation = '0';
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        bitcoinEquation,
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: color2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: icon.getCryptocurrencyIcon(
                                      selectedCryptoCurrency),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 2.2,
                                width: 400,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton('1', () {
                              updateUI('1');
                            }),
                            RoundIconButton('2', () {
                              updateUI('2');
                            }),
                            RoundIconButton('3', () {
                              updateUI('3');
                            }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton('4', () {
                              updateUI('4');
                            }),
                            RoundIconButton('5', () {
                              updateUI('5');
                            }),
                            RoundIconButton('6', () {
                              updateUI('6');
                            }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton('7', () {
                              updateUI('7');
                            }),
                            RoundIconButton('8', () {
                              updateUI('8');
                            }),
                            RoundIconButton('9', () {
                              updateUI('9');
                            }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton('.', () {
                              updateUI('.');
                            }),
                            RoundIconButton('0', () {
                              updateUI('0');
                            }),
                            RoundIconButton('⌫', () {
                              updateUI('⌫');
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.text, this.onPressed);
  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape:
          CircleBorder(side: BorderSide(color: mainColor, width: 1.5)),
      fillColor: Colors.white,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      disabledElevation: 5,
      child: Text(
        text,
        style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Rancher'),
      ),
    );
  }
}
