import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senja_app/constant.dart';
import 'package:senja_app/widgets/my_header.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMemberScreen extends StatefulWidget {
  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  bool _isLoading = false;
  bool _isFieldNamaLengkapValid;
  bool _isFieldNoHPValid;
  bool _isFieldAlamatValid;
  TextEditingController _controllerNamaLengkap = TextEditingController();
  TextEditingController _controllerNoHP = TextEditingController();
  TextEditingController _controllerAlamat = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Tambah Member"),
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
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldNamaLengkap(),
                new Container(margin: const EdgeInsets.only(bottom: 10.0),),
                _buildTextFieldNoHP(),
                new Container(margin: const EdgeInsets.only(bottom: 10.0),),
                _buildTextFieldAlamat(),
                new Container(margin: const EdgeInsets.only(bottom: 10.0),),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.blue,
                      )
                    ),
                    onPressed: (){

                    }
                  ),
                ),
              ],
            ),
          ),
          _isLoading ? Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.3,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.grey,
                ),
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ) : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldNamaLengkap(){
    return TextFormField(
      controller: _controllerNamaLengkap,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // hintText: 'Enter your full name',
        labelText: "Full Name",
        errorText: _isFieldNamaLengkapValid == null || _isFieldNamaLengkapValid ? null : "Full name is required",
        border: OutlineInputBorder(
          borderSide: BorderSide()
        ),
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if(isFieldValid != _isFieldNamaLengkapValid){
          setState(() => _isFieldNamaLengkapValid = isFieldValid);
        }
      }
    );
  }
  Widget _buildTextFieldNoHP(){
    return TextFormField(
      controller: _controllerNoHP,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // hintText: 'Enter your full name',
        labelText: "No HP",
        errorText: _isFieldNoHPValid == null || _isFieldNoHPValid ? null : "No HP is required",
        border: OutlineInputBorder(
          borderSide: BorderSide()
        ),
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if(isFieldValid != _isFieldNoHPValid){
          setState(() => _isFieldNoHPValid = isFieldValid);
        }
      }
    );
  }
  Widget _buildTextFieldAlamat(){
    return TextFormField(
      controller: _controllerAlamat,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // hintText: 'Enter your full name',
        labelText: "Alamat",
        errorText: _isFieldAlamatValid == null || _isFieldAlamatValid ? null : "Alamat is required",
        border: OutlineInputBorder(
          borderSide: BorderSide()
        ),
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if(isFieldValid != _isFieldAlamatValid){
          setState(() => _isFieldAlamatValid = isFieldValid);
        }
      }
    );
  }
}