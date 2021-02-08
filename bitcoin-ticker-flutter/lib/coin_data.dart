import 'services/networking.dart';

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

const apiKey = 'xxxxxxxxxxxxxxxxxxxxxxxx';
const coinDataURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<String> getCurrencyRate(
      String assetIdBase, String assetIdQuote) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinDataURL/$assetIdBase/$assetIdQuote?apikey=$apiKey');

    var data = await networkHelper.getData();
    return data['rate'].toStringAsFixed(1);
  }

  Future<Map<String, String>> getCoinRates(String assetIdQuote) async {
    Map<String, String> coinRates = {};

    for (String coin in cryptoList) {
      String rate = await getCurrencyRate(coin, assetIdQuote);
      coinRates[coin] = rate;
    }

    return coinRates;
  }

  // Future<dynamic> getCoinData(String assetIdBase) {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('$coinDataURL/$assetIdBase?invert=false&apikey=$apiKey');
  //   return networkHelper.getData();
  // }
  //
  // Future<Map<String, String>> getCurrentCurrencies(
  //     String assetIdBase, List<String> assetIdQuotes) async {
  //   Map<String, String> rates = {};
  //   var coinData = await getCoinData(assetIdBase);
  //
  //   for (var rate in coinData['rates']) {
  //     if (assetIdQuotes.contains(rate['asset_id_quote'])) {
  //       rates[rate['asset_id_quote']] = rate['rate'];
  //     }
  //   }
  //
  //   return rates;
  // }
}
