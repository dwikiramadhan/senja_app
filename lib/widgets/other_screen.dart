import 'package:flutter/material.dart';
import 'package:senja_app/main.dart';
import 'package:senja_app/widgets/home_screen.dart';
import 'package:senja_app/widgets/info_screen.dart';
import 'package:senja_app/widgets/member.dart';

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Lainnya"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF3383CD),
                  Color(0xFF11249F),
                ]
            ),
          ),          
         ),    
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text("M Dwiki Ramadhan"),
              subtitle: Text("dwikiramadhan73@gmail.com"),
              trailing: FlatButton(
                child: Text("Keluar"),
                // onPressed: ButtonClick,
                textColor: Colors.red,
                highlightColor: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0000),
                backgroundImage: AssetImage('assets/images/membership.png'),
              ),
              title: Text('Member'),
              // subtitle: Text('A strong animal'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return MemberScreen();
                    }
                  )
                );
              },
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0000),
                backgroundImage: AssetImage('assets/images/menu.png'),
              ),
              title: Text('Menu'),
              // subtitle: Text('A strong animal'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => MyApp())
                );
              },
              selected: true,
            ),
            Divider(),
          ],
        ),
      )
    );
  }
}