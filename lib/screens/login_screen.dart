import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final pswdTextController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _formEmailKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    pswdTextController.dispose();
    super.dispose();
  }

  Future<void> getEmailVerify(BuildContext context) async {
    final auth = Provider.of<Auth>(context);
    await auth.authenticate(emailTextController.text, pswdTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context);

    return GestureDetector(
        //***To Remove Focus From TextFields***//
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Form(
          key: _formEmailKey,
          child: Scaffold(
              key: _scaffoldKey,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "WELCOME!",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: Card(
                            elevation: 20,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.26,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 10, 30, 0),
                                      child: TextFormField(
                                        controller: emailTextController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.mail),
                                          hintText: "Email",
                                        ),
                                        validator: (value) {
                                          String p =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regExp = new RegExp(p);
                                          if (regExp.hasMatch(value)) {
                                            return null;
                                          } else if (value.isEmpty) {
                                            return 'Please Enter Email';
                                          }
                                          return 'Please enter valid Email';
                                        },
                                      ),
                                    ),
                                    Container(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 20, 30, 5),
                                      child: TextFormField(
                                        controller: pswdTextController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            hintText: "Password"),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter Password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ))
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(60, 60, 60, 0),
                            child: Center(
                                child: SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: RaisedButton(
                                      textColor: Colors.white,
                                      color: Colors.orange,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        final form = _formEmailKey.currentState;
                                        FocusScope.of(context).unfocus();
                                        if (form.validate()) {
                                          getEmailVerify(context);
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ))))
                      ],
                    ),
                  )),
                ),
              )),
        ));
  }

  void showInSnackBar(value) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
          content: new Text(value, style: TextStyle(color: Colors.red)),
          duration: Duration(seconds: 1)),
    );
  }
}
