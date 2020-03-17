import 'package:flutter/material.dart';
//import 'package:flutter/semantics.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(),
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget{
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage>{ 
  final scaffoldkey = new GlobalKey<ScaffoldState>();
  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

 @override
  void initState() {
    // TODO: inplementar initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: inplementar dispose
    super.dispose();
  }

  void _submit(){
    final form = formkey.currentState;
    if(form.validate()){
      form.save();

      performLogin();
    }
  }

  void performLogin(){
    final snackbar = new SnackBar(
      content: new Text("Correo: $_email Contraseña: $_password"), 
      );
      scaffoldkey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: inplementar build
    return new Scaffold(
      key: scaffoldkey,
      appBar: new AppBar(
        title: new Text("Ingresar Aqui"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.00),
        child: new Form(
          key: formkey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: "Email"),
                validator: (val) =>
                !val.contains('@')?'Mal el correo' :null,
                onSaved: (val) => _email = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "Contraseña"),
                validator: (val) =>
                val.length<6 ?'Contraseña muy corto' : null,
                onSaved: (val) => _password=val,
                obscureText: true,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.00),
              ),
              new RaisedButton(
                child: new Text("Ingresar"),
                onPressed: _submit,)
            ],
          ),
        ),  
      ),
    );
  }
}
