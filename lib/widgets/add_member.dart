import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final bool _isLoading = false;
  bool? _isFieldNamaLengkapValid;
  bool? _isFieldNoHPValid;
  bool? _isFieldAlamatValid;
  final TextEditingController _controllerNamaLengkap = TextEditingController();
  final TextEditingController _controllerNoHP = TextEditingController();
  final TextEditingController _controllerAlamat = TextEditingController();

  @override
  void dispose() {
    _controllerNamaLengkap.dispose();
    _controllerNoHP.dispose();
    _controllerAlamat.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
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
                  child: ElevatedButton(
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
        errorText: _isFieldNamaLengkapValid ?? true ? null : "Full name is required",
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
        errorText: _isFieldNoHPValid ?? true ? null : "No HP is required",
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
        errorText: _isFieldAlamatValid ?? true ? null : "Alamat is required",
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