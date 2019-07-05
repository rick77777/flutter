import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarthome_app/Pages/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  //Create global key for the Sign in form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
                TextFormField(
                    onSaved: (input) => _email = input,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please type an Email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                ),
                TextFormField(
                    validator: (input) {
                      if (input.isEmpty || input.length < 6) {
                        return 'Please provide a Password of atleast 6 characters';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                      labelText: 'Password'
                    ),
                  obscureText: true,
                ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign In'),
              )
            ],
          ),
        ),
      );
    }
  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
}
