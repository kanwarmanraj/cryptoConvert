import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin/constants.dart';

class CurrencyIcon {
  Icon getCurrencyIcon(String currencyName) {
    if (currencyName == 'GPD') {
      return Icon(
        FontAwesomeIcons.poundSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'JPY') {
      return Icon(
        FontAwesomeIcons.yenSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'EUR') {
      return Icon(
        FontAwesomeIcons.euroSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'TRY') {
      return Icon(
        FontAwesomeIcons.liraSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'INR') {
      return Icon(
        FontAwesomeIcons.rupeeSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'RUB') {
      return Icon(
        FontAwesomeIcons.rubleSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'ILS') {
      return Icon(
        FontAwesomeIcons.shekelSign,
        color: iconColor,
        size: 32,
      );
    } else if (currencyName == 'KRW') {
      return Icon(
        FontAwesomeIcons.wonSign,
        color: iconColor,
        size: 32,
      );
    } else
      return Icon(
        FontAwesomeIcons.dollarSign,
        color: iconColor,
        size: 32,
      );
  }

  Icon getCryptocurrencyIcon(String currencyName) {
    if (currencyName == 'ETH') {
      return Icon(
        FontAwesomeIcons.ethereum,
        color: iconColor,
        size: 32,
      );
    }
    else
      return Icon(
        FontAwesomeIcons.bitcoin,
        color: iconColor,
        size: 32,
      );
  }
}
