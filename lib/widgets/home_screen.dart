import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senja_app/constant.dart';
import 'package:senja_app/widgets/counter.dart';
import 'package:senja_app/widgets/my_header.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senja Tea ID',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at Home.",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Transaksi Hari ini\n",
                              style: kTitleTextStyle,
                            ),
                            TextSpan(
                              text: "Newest update " + formatedTanggal.toString(), 
                              style: TextStyle(
                                color: kTextLightColor,
                              )
                            )
                          ]
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infected",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),
                        Counter(
                          color: kRecoverColor,
                          number: 46,
                          title: "Recovered",
                        ),
                      ]
                    ),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    ListTile(
                      leading: Icon(Icons.movie),
                      title: Text(
                        "M Dwiki Ramadhan", 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "12"
                      )
                    ),
                    ListTile(
                      leading: Icon(Icons.movie),
                      title: Text(
                        "M Dwiki Ramadhan", 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "12"
                      )
                    ),
                    ListTile(
                      leading: Icon(Icons.movie),
                      title: Text(
                        "M Dwiki Ramadhan", 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "12"
                      )
                    ),
                    ListTile(
                      leading: Icon(Icons.movie),
                      title: Text(
                        "M Dwiki Ramadhan", 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "12"
                      )
                    ),
                  ]
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}