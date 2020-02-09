import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nature_eye_witness_app/services/auth_service.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/button_widget.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/constants.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/loader.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;

  const LoginPage({Key key, this.toggleView}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loader() : Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text("Log In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
              SizedBox(
                height: 20,
              ),
              Text(error,style: TextStyle(color: Colors.red, fontSize: 14),),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email',prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password',prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be 6 characters or more';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              Button(
                action: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
//                    Scaffold.of(context).showSnackBar(
//                        SnackBar(content: Text('Processing Data')));
                    dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        loading = false;
                        error = 'email or password incorrect, Please try again';
                      });
                    }
                  }
                },
                name: "Login",
              ),
              GestureDetector(
                child: Text("Are you new here? Click me to register"),
                onTap: () {
                  widget.toggleView();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
