import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseConsultaPage extends StatefulWidget {
  @override
  _FirebaseConsultaPageState createState() => _FirebaseConsultaPageState();
}

class _FirebaseConsultaPageState extends State<FirebaseConsultaPage> {
  var users = [];

  final dbRef = FirebaseDatabase.instance.reference();

  void consultar() async {
    dbRef.child('users').once().then((DataSnapshot snapshot) {
      setState(() {
        for (var i = 0; i < snapshot.value.length; i++) {
          if (snapshot.value[i] != null) {
            users.add(snapshot.value[i]);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Lista de Usuarios"),
          Flexible(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        users[index]['name'][0],
                        style: TextStyle(
                            fontSize: 16,
                            backgroundColor: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(users[index]['name']),
                      subtitle: Text(users[index]['age'].toString()),
                    );
                  })),
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text(
                "Consulta",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent[100],
              onPressed: consultar,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          )
        ],
      )),
    );
  }
}
