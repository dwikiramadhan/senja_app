import 'package:flutter/material.dart';
import 'package:senja_app/widgets/add_member.dart';
import 'package:senja_app/widgets/info_screen.dart';

class MemberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("List Member"),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            tooltip: "Tambah Member",
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context){
                    return AddMemberScreen();
                  }
                ),
              );
            },
          )
        ],
      ),
    );
  }
}