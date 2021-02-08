import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData _coinData = CoinData();

  String selectedCurrency = "USD";
  Map<String, String> coinRates = {};
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    updateUI(selectedCurrency);
  }

  void updateUI(String currency) async {
    isWaiting = true;
    Map<String, String> newData =
        await _coinData.getCoinRates(selectedCurrency);
    isWaiting = false;

    setState(() {
      coinRates = newData;
    });
  }

  Widget iosPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        String currency = currenciesList[selectedIndex];
        setState(() {
          selectedCurrency = currency;
          updateUI(currency);
        });
      },
      children: currenciesList
          .map((e) => Text(e, style: TextStyle(color: Colors.white)))
          .toList(),
    );
  }

  Widget androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList
          .map(
            (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
          )
          .toList(),
      onChanged: (currency) {
        setState(() {
          selectedCurrency = currency;
          updateUI(currency);
        });
      },
    );
  }

  List<CryptCard> makeCoinCards() {
    List<CryptCard> cards = [];

    for (String coin in cryptoList) {
      cards.add(CryptCard(
        coin: coin,
        rate: isWaiting ? '?' : coinRates[coin],
        currency: selectedCurrency,
      ));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: makeCoinCards(),
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CryptCard extends StatelessWidget {
  const CryptCard({
    Key key,
    @required this.coin,
    @required this.rate,
    @required this.currency,
  }) : super(key: key);

  final String coin;
  final String rate;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $coin = $rate $currency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
