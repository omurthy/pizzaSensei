import 'package:flutter/material.dart';
 

class Comments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Comments();
}

class _Comments extends State<Comments> {
  String name = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          title: Text(
            'Comments',
            style: TextStyle(
                color: Colors.yellowAccent,
                fontFamily: 'Amatic SC',
                fontSize: 35),
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SenseiImageWidget(),
                TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.yellow[100],
                        fontFamily: 'Oxygen',
                        fontSize: 25),
                    hintText: 'Please write your name..',
                  ),
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontFamily: 'Amatic SC',
                      fontSize: 35),
                  onChanged: (String nameString) {
                    setState(() {
                      name = nameString;
                    });
                  },
                ),
                DropdownButton<String>( 
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, 
                        child: Text(value)
                        );
                  }).toList(),
                  onChanged: (String value) {
                    _onDropdownChanged(value);
                  },
                  value: _currency,
                ),
                Text(
                  'Hello ' + name + '!',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Amatic SC',
                      fontSize: 35),
                )
              ],
            )));
  }

  void _onDropdownChanged(String value) {
    setState(() {
          this._currency = value;
        });
  }
}

class SenseiImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/sensei-logo.png');
    Image image = Image(image: pizzaAsset, width: 100.0, height: 100.0);
    return Container(child: Expanded(child: image));
  }
}
