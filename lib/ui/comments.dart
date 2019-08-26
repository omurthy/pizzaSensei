import 'package:flutter/material.dart';
import './home.dart';
class Comments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Comments();
}

class _Comments extends State<Comments> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Comments',style: TextStyle(color: Colors.yellowAccent,
                  fontFamily: 'Amatic SC',
                  fontSize: 35 ),),
      ),
        backgroundColor: Colors.deepOrangeAccent,
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SenseiImageWidget(),
                TextField(
                  decoration: InputDecoration(hintStyle: TextStyle(color: Colors.yellow[100],
                  fontFamily: 'Oxygen',
                  fontSize: 25 ),
                    hintText:  'Please write your name..' ,
                  ),
                  style: TextStyle(
                  color: Colors.yellowAccent,
                  fontFamily: 'Amatic SC',
                  fontSize: 35 
                ),
                  onChanged: (String nameString) {
                    setState(() {
                      name = nameString;
                    });
                  },
                ),
                Text('Hello ' + name + '!',style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Amatic SC',
                  fontSize: 35 
                ),)
              ],
            )));
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