import 'package:flutter/material.dart';
import 'package:teste_form/tarefa.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Tarefa task = Tarefa();
  TextEditingController tarefaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tarefas"), actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
            ))
      ]),
      body: Container(
        color: Colors.blueAccent[100],
        height: MediaQuery.of(context).size.height,
        child: Card(
          elevation: 10,
          margin: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Container(
                    child: TextFormField(
                      controller: tarefaController,
                      autofocus: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              String tarefa = tarefaController.text;
                              if (tarefa != "") {
                                task.addTask(tarefa);
                              }
                              tarefaController.text = "";
                            });
                          },
                        ),
                        hintText: "Adicionar Tarefa",
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent[100], width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        // filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black, fontSize: 0),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: task.tarefas.length,
                      itemBuilder: (context, index) => ListTile(
                            title: Text(task.tarefas[index]),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
