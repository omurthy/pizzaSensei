import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Container(
      alignment: Alignment.center,
      /*width: 192.0,
       height: 96.0,
       margin: EdgeInsets.all(50.0),*/
      color: Colors.deepOrangeAccent,
      padding: EdgeInsets.only(top: 30.0, left: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            "PizzaSensei",
            style: TextStyle(
                fontSize: 90,
                fontFamily: 'Amatic SC',
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              SenseiImageWidget(),
            ],
          ),
          Row(children: <Widget>[
            Expanded(
                child: Text(
              "Margarita",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Shadows Into Light',
                  fontWeight: FontWeight.normal),
            )),
            Expanded(
                child: Text(
              "Tomato,Mozarilla,Basil",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 35.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Shadows Into Light',
                  fontWeight: FontWeight.normal),
            )),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                "Marinara",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 30.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Shadows Into Light',
                    fontWeight: FontWeight.normal),
              )),
              Expanded(
                  child: Text(
                "Tomato,Garlic",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 35.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Shadows Into Light',
                    fontWeight: FontWeight.normal),
              )),
            ],
          ),
          
          PizzaImageWidget(),
          OrderButton(),
          Row(
            children: <Widget>[
              Expanded(child: AboutButton(),)
               ,Expanded(child: ContactButton(), )
            ],
          ),
        ],
      ),
    ));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza.png');
    Image image = Image(image: pizzaAsset, width: 200.0, height: 200.0);
    return Container(child: Expanded(child: image));
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

class ContactButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var contactButton =  RaisedButton(
      child:Text("Contact",),
      color : Colors.yellowAccent,
      elevation:13.0,
      onPressed: (){
      contactAlert(context);
      },
    );
    return contactButton;
  }
  void contactAlert(BuildContext context){
    var alert = AlertDialog(
      title: Text("Contact Informations" ),
      content: Text('Tel : 0557 557 82 55',textDirection: TextDirection.ltr), 
      );
       
       showDialog(
         context: context,
         builder: (BuildContext context){
           return alert;
         }
       );
  }
}

class AboutButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var aboutbutton = RaisedButton(
      child: Text("About"),
      elevation: 12,
      onPressed: (){
        aboutAlert(context);
      },

    );
    return aboutbutton;
  }

void aboutAlert(BuildContext context){
 var aboutAlert = AlertDialog(
      title: Text("ABOUT SENSEI PIZZA"),
      content: Text("Sensei Pizza is very delicius and very cheap pizza of the world ever.Since 1987")
    );
    showDialog( 
      context:context,
      builder : (BuildContext context){
        return aboutAlert;
      });
}


}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text("Order Your Pizza!"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          order(context);
        },
      ),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
 