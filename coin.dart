import 'package:bitcoin/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'USD',
  'GPD',
  'JPY',
  'EUR',
  'INR',
  'TRY',
  'RUB',
  'ILS',
  'KRW',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',

];

class CoinData {

  CoinData(this.selectedCurrency,this.selectedCryptoCurrency);
  String selectedCurrency ;
  String selectedCryptoCurrency;

  Future<dynamic> getConverstion() async{
   // http.Response response =await http.get('https://rest.coinapi.io/v1/exchangerate/$selectedCryptoCurrency/$selectedCurrency?apikey=4995C66A-2164-4FDC-B8AF-E37381B910B2');
    http.Response response =await http.get('https://rest.coinapi.io/v1/exchangerate/$selectedCryptoCurrency/$selectedCurrency?apikey=4995C66A-2164-4FDC-B8AF-E37381B910B2');

    if(response.statusCode==200){
      String data=response.body;
      var oneCryptoInCurr=jsonDecode(data)['rate'];


      return oneCryptoInCurr;

    }
    else print('error occured');
  }

  }

