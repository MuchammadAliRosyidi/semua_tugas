import 'package:flutter/material.dart';
import 'package:proyek_todolist/database.dart';
import 'package:proyek_todolist/todo.dart';

class Todopage extends StatelessWidget {
  const Todopage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  TextEditingController _namaCtrl = TextEditingController();
  TextEditingController _deskripsiCtrl = TextEditingController();
  TextEditingController _searchCtrl = TextEditingController();
  List<Todo> todolist = [];

  final db = database();

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future<void> refreshList() async {
    final todos = await db.getAllTodos();
    setState(() {
      todolist = todos;
    });
  }

  Future addItem() async {
    await db.addTodo(Todo(_namaCtrl.text, _deskripsiCtrl.text));
    //todolist.add(Todo(_namaCtrl.text, _deskripsiCtrl.text));
    refreshList();

    _namaCtrl.text = '';
    _deskripsiCtrl.text = '';
  }

  void updateItem(int index, bool done) async {
    todolist[index].done = done;
    await db.updateTodo(todolist[index]);
    refreshList();
  }

  void deleteItem(int id) async {
    // todolist.removeAt(index);
    await db.deleteTodo(id);
    refreshList();
  }

  void cariTodo(String text) async {
    // ignore: unused_local_variable
    String teks = _searchCtrl.text.trim();
    // ignore: unused_local_variable
    List todos = [];
    if (teks.isEmpty)
      // ignore: unused_local_variable
      todos = await db.getAllTodos();
    else {
      todos = await db.searchTodo(teks);
    }
    setState(() {
      todolist = todos;
    });
  }

  void tampilForm() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.all(20),
              title: Text("Tambah Todo"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Tutup")),
                ElevatedButton(
                    onPressed: () {
                      addItem();
                      Navigator.pop(context);
                    },
                    child: Text("Tambah"))
              ],
              content: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextField(
                      controller: _namaCtrl,
                      decoration: InputDecoration(hintText: 'Nama Todo'),
                    ),
                    TextField(
                      controller: _deskripsiCtrl,
                      decoration:
                          InputDecoration(hintText: 'Deskripsi perkerjaan'),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Todo List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tampilForm();
        },
        child: const Icon(Icons.add_box),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _searchCtrl,
              onChanged: (_) {
                cariTodo(_searchCtrl.text);
              },
              decoration: InputDecoration(
                  hintText: 'cari apa',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: todolist[index].done
                          ? IconButton(
                              icon: const Icon(Icons.check_circle),
                              onPressed: () {
                                updateItem(index, !todolist[index].done);
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.radio_button_unchecked),
                              onPressed: () {
                                updateItem(index, !todolist[index].done);
                              },
                            ),
                      title: Text(todolist[index].nama),
                      subtitle: Text(todolist[index].deskripsi),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteItem(todolist[index].id ?? 0);
                        },
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
