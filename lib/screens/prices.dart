import 'package:flutter/material.dart';

class Prices extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Prices();
}

class _Prices extends State<Prices> {
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  final double _formDistance = 5.0;
  String _currency = 'Dollars';
  String result = '';
  TextEditingController distanceController = TextEditingController();
  TextEditingController awgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text('Prices'),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance),
                  child: TextField(
                    controller: distanceController,
                    decoration: InputDecoration(
                        hintText: 'e.g 23.0',
                        labelStyle: textStyle,
                        labelText: 'Distance',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance),
                  child: TextField(
                    controller: awgController,
                    decoration: InputDecoration(
                        hintText: 'e.g 17.0',
                        labelStyle: textStyle,
                        labelText: 'Distance per Unit',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance),
                  child: 
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                        hintText: 'e.g 1.65',
                        labelStyle: textStyle,
                        labelText: 'Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  )),
              
              DropdownButton<String>(
                items: this._currencies.map((String val) {
                  return DropdownMenuItem<String>(value: val, child: Text(val));
                }).toList(),
                onChanged: (String value) {
                  _onDropdownChanged(value);
                },
                value: _currency,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text('Submit', textScaleFactor : 1.5),
                   
                    onPressed: () {
                      setState(() {
                        result = _calculate();
                      });
                    },
                  )),
                  Expanded(
                      child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text('Reset', textScaleFactor : 1.5),
                    onPressed: () {
                      setState(() {
                          _reset();
                      });
                    },
                  )),
                ],
              ),
              Expanded(child: Text(result)),
            ])));
  }

  void _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consuption = double.parse(awgController.text);
    double _totalCost = _distance / _consuption * _fuelCost;

    String _result = 'Total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void _reset() {
    distanceController.text = '';
    priceController.text = '';
    awgController.text = '';

    setState(() {
      result = '';
    });
  }
}
