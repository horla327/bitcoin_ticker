import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NGN',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = 'A89BCB0C-0E87-40C8-B25D-9455D49D6120';

// const bitcoinAverageURL =
//     'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL =
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=A89BCB0C-0E87-40C8-B25D-9455D49D6120';
    http.Response response = await http.get(Uri.parse(requestURL));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
