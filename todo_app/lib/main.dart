import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/todo_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _linearGradient = LinearGradient(
      colors: [Color(0xfffc00ff), Color(0xff00dbde)], stops: [0.0, 0.7]);
  final _formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final List<Todo> todos = [];
  final date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());
    String time = timeOfDay.format(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          tooltip: 'Add item to ToDo list',
          backgroundColor: Color(0xfffc00ff),
          icon: Icon(Icons.add),
          onPressed: () {
            showDilog(context);
          },
          label: Text('Add')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        flexibleSpace:
            Container(decoration: BoxDecoration(gradient: _linearGradient)),
        leading: Icon(
          Icons.work,
        ),
        elevation: 0.0,
        title: Text('What To Do!'),
      ),
      body: Container(
          decoration: BoxDecoration(gradient: _linearGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                child: Column(children: [
                  Text(
                    '$time',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ]),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      color: Color(0xffececec)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffececec),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(10, 10),
                                      color: Colors.black38,
                                      blurRadius: 20),
                                  BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Colors.white.withOpacity(0.85),
                                      blurRadius: 20)
                                ]),
                            child: ListTile(
                              leading: Icon(
                                Icons.arrow_right,
                                color: Colors.blue,
                              ),
                              title: Text(
                                todos[index].title,
                                style: TextStyle(
                                  decoration: todos[index].isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              trailing: ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Tooltip(
                                    message: "Done",
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.check_box,
                                        color: todos[index].isDone
                                            ? Colors.green
                                            : Colors.blue,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          todos[index].isDone =
                                              !todos[index].isDone;
                                        });
                                      },
                                    ),
                                  ),
                                  Tooltip(
                                    message: "Delete",
                                    child: IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            todos.removeAt(index);
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void showDilog(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Today\'s List"),
      content: SizedBox(
          child: Form(
        key: _formkey,
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Entry can\'t be empty!';
            }
            return null;
          },
          cursorColor: Colors.deepPurple,
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'TODO',
            hintText: 'What to do today.',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            prefixIcon: Icon(
              Icons.work,
            ),
          ),
        ),
      )),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                if (_formkey.currentState.validate()) {
                  todos.add(Todo(title: _controller.text, isDone: false));
                  _controller.clear();
                  Navigator.of(context).pop();
                }
              });
            },
            child: Text("Add"))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
