import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo.dart';
import 'package:intl/intl.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Todo> todos = [];
  TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      todos = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                _gotoDone(context);
              },
              focusColor: Colors.white,
              icon: Icon(Icons.done_all_outlined, color: Colors.white),
            ),
          )
        ],
      ),
      // backgroundColor: Colors.grey,
      body: Container(padding: EdgeInsets.all(2), child: _todoList()),
      floatingActionButton: FloatingActionButton(
        tooltip: "Todo here",
        onPressed: () {
          // print("open dialog and take todo");
          _showMyDialog(context);
        },
        child: IconButton(
            icon: Icon(
          Icons.edit,
          color: Colors.white,
        )),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  Widget _todoList() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            var todo = todos[index];
            return ListTile(
              title: Text(todo.text),
              tileColor: todo.isDone ? Colors.white54 : Colors.white,
              subtitle: Text(getTime(todo.createdAt).toString()),
              trailing: todo.isDone
                  ? Container(
                      child: IconButton(
                      icon: Icon(Icons.done_all),
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        this.setState(() {
                          todos[todo.id - 1].isDone = false;
                          todos[todo.id - 1].completedAt = null;
                        });
                      },
                    ))
                  : Container(
                      child: IconButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icon(Icons.check),
                      onPressed: () {
                        this.setState(() {
                          todos[todo.id - 1].isDone = true;
                          todos[todo.id - 1].completedAt = DateTime.now();
                        });
                      },
                    )),
            );
          }),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, //
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Todo'),
          content: SingleChildScrollView(
            child: TextField(
              controller: _textController,
              minLines: 1,
              maxLines: 1000,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Your todo here",
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _textController.clear();
                  Navigator.of(context).pop();
                }),
            IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() => todos.add(Todo(_textController.text,
                      DateTime.now(), null, false, todos.length + 1)));
                  _textController.clear();
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  void _gotoDone(BuildContext context) {
    List<Widget> tiles = [];
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // Add lines from here...
        builder: (BuildContext context) {
          todos.forEach((todo) {
            if (todo.isDone) {
              tiles.add(
                ListTile(
                    title: Text(todo.text),
                    subtitle: Text(getTime(todo.createdAt).toString() +
                        ' - ' +
                        getTime(todo.completedAt).toString()),
                    trailing: Container(
                        child: IconButton(
                      icon: Icon(Icons.done_all),
                      color: Colors.deepOrangeAccent,
                    ))),
              );
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: Text('Completed Todos'),
            ),
            body: ListView(children: tiles),
          );
        }, // ...to here.
      ),
    );
  }

  getTime(DateTime date) {
    return DateFormat("dd-MM-yy h:m aaa").format(date);
  }
}
