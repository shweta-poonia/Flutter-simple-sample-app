import 'package:flutter/material.dart';

import './shared/styles.dart';
import './shared/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'HOUSR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
      Center(
        

  child : new SingleChildScrollView(
         child: Column(
              children: <Widget>[myLayoutWidget(),quickAction(), serviceUpdate(), partnerOffers(),myLayoutWidgetSecond()],
         ),
       ),
      ),
              ]
      )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   tooltip: 'Add',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('SEE ALL', style: contrastText),
        ),
      )
    ],
  );
}

/////////////////////
// QuickAction widget
////////////////////
Widget quickAction() {
  //Visitor Icon
  var visitorIcon = new AssetImage('images/icons/visitor.png');
  var visitors = new Image(image: visitorIcon, fit: BoxFit.cover);
  //service Icon
  var serviceIcon = new AssetImage('images/icons/service.png');
  var services = new Image(image: serviceIcon, fit: BoxFit.cover);
  //manage Icon
  var manageIcon = new AssetImage('images/icons/manage.png');
  var manages = new Image(image: manageIcon, fit: BoxFit.cover);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Quick Action', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            quickActionItem('Visitor Pass', visitors, onPressed: () {}),
            quickActionItem('Service Request', services, onPressed: () {}),
            quickActionItem('My Payments', visitors, onPressed: () {}),
            quickActionItem('Manage Services', manages, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget quickActionItem(String name, image, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 100,
            height: 100,
            child: FloatingActionButton(
                // shape: CircleBorder(),
                shape: RoundedRectangleBorder(),
                heroTag: name,
                onPressed: onPressed,
                backgroundColor: Colors.white,
                child: Container(
                    padding: EdgeInsets.fromLTRB(11, 15, 11, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        image,
                        Container(
                          width: double.infinity,
                          child: Text(name, style: categoryText),
                        )
                      ],
                    )))),
      ],
    ),
  );
}

//////////////////
/// Service Update
//////////////////
Widget serviceUpdate() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Service Updates', onViewMore: () {}),
      SizedBox(
        height: 180,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            serviceUpdateItem(
                '#612783', true, '12-Jun', 'Plumbing - Master Balcony',
                onPressed: () {}),
            serviceUpdateItem(
                '#612783', false, '12-Jun', 'Plumbing - Master Balcony',
                onPressed: () {}),
            serviceUpdateItem(
                '#612783', true, '12-Jun', 'Plumbing - Master Balcony',
                onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget serviceUpdateItem(String ticket, bool status, String date, String type,
    {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 180,
            height: 120,
            child: FloatingActionButton(
                // shape: CircleBorder(),
                shape: RoundedRectangleBorder(),
                heroTag: ticket,
                onPressed: onPressed,
                backgroundColor: Colors.white,
                child: Container(
                    padding: EdgeInsets.fromLTRB(11, 15, 0, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              Text(
                                ticket,
                                style: ticketText,
                              ),
                              (status)
                                  ? Text(
                                      'Done',
                                      style: TextStyle(
                                          backgroundColor: Colors.green),
                                    )
                                  : Text(
                                      'Queued',
                                      style: TextStyle(
                                          backgroundColor: Colors.blueGrey),
                                    )
                            ])),
                        Container(
                            width: double.infinity,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(date, style: categoryText),
                                  Text(
                                    type,
                                    style: TextStyle(color: Color(0xff000000)),
                                  )
                                ]))
                      ],
                    )))),
      ],
    ),
  );
}

/////////////////////
///Partner Offers
/////////////////////

Widget partnerOffers(){
  //Visitor Icon
  var partnerImg = new AssetImage('images/partners.png');
  var partner = new Image(image: partnerImg, fit: BoxFit.cover);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Quick Action', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            partnerOffersItem('Free Delivery', partner, onPressed: () {}),
            partnerOffersItem('Free Delivery', partner, onPressed: () {}),
            partnerOffersItem('Free Delivery', partner, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget partnerOffersItem(String name, imagePartners, {onPressed}) {
  return Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'images/partners.png',
              width: 190,
              height: 110,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text("This is a Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.white)),
          ),
        ],

    );
}

///////////////////////
///Purple Card Layout
///////////////////////
// replace this method with code in the examples below
Widget myLayoutWidget() {
  // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.purple[800],
            Colors.purple[700],
            Colors.purple[600],
            Colors.purple[400],
          ],
        ),
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0)),

    // column of three rows
    child: Column(
      // this makes the column height hug its content
      mainAxisSize: MainAxisSize.min,
      children: [
        // first row
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.hotel,
                color: Colors.green,
              ),
            ),
            Text(
              'Rent Due - September',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 50.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),

        // second row (single item)
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 10,
              ),
              child: Text(
                'Pay now to avoid late payment fees!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
Widget myLayoutWidgetSecond() {
  // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.purple[800],
            Colors.purple[700],
            Colors.purple[600],
            Colors.purple[400],
          ],
        ),
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0)),

    // column of three rows
    child: Column(
      // this makes the column height hug its content
      mainAxisSize: MainAxisSize.min,
      children: [
        // first row
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.hotel,
                color: Colors.green,
              ),
            ),
            Text(
              'Upcoming Payment',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 50.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),

        // second row (single item)
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 10,
              ),
              child: Text(
                'Rent for september . Pay now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}