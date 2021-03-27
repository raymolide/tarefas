import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_form/consulta.dart';
import 'package:teste_form/tarefa.dart';
import 'package:teste_form/task.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Tarefa controller = Tarefa();

  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent[100],
        child: Center(
            child: IntrinsicHeight(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.only(left: 15, right: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.security,
                        size: 50,
                        color: Colors.blueAccent[100],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Username",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent[100], width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 0),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Observer(
                          builder: (_) => TextFormField(
                            obscureText: passwordVisibility,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility),
                                onPressed: () {
                                  controller.changeVisibility();
                                  setState(() {
                                    passwordVisibility =
                                        controller.passwordVisibility;
                                  });
                                },
                              ),
                              hintText: "Password",
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent[100], width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 0),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent[100],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Task()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text(
                          "Consulta",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent[100],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirebaseConsultaPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
