import 'package:daily_task/models/my_task.dart';
import 'package:daily_task/widget.dart/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight;
  late double _deviceWidth;
  String? _newContent;
  late Box _box;

  @override
  void initState() {
    super.initState();
    _openHiveBox();
  }

  Future<void> _openHiveBox() async {
    _box = await Hive.openBox('tasks');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        backgroundColor: const Color.fromARGB(255, 13, 119, 121),
        toolbarHeight: _deviceHeight * 0.14,
        title: const Text('DAILY TASK',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 243, 228, 228))),
        actions: <Widget>[
          MenuButton(),
        ],
      ),
      body: _box.isOpen ? _dailyTaskList() : _loadingIndicator(),
      backgroundColor: const Color.fromARGB(255, 2, 59, 59),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _loadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _dailyTaskList() {
    List tasks = _box.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var task = MyTask.fromMap(tasks[index]);
        return Container(
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              style: BorderStyle.solid,
              color: const Color.fromARGB(255, 241, 146, 87),
            ),
            shape: BoxShape.rectangle,
          ),
          child: ListTile(
            title: Text(
              task.content,
              style: TextStyle(
                  color: const Color.fromARGB(255, 243, 228, 228),
                  fontWeight: FontWeight.w800,
                  decoration: task.done ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(
              task.timestamp.toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 243, 228, 228),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              task.done
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
              color: const Color.fromARGB(255, 240, 97, 9),
            ),
            onTap: () {
              task.done = !task.done;
              _box.putAt(index, task.toMap());
              setState(() {});
            },
            onLongPress: () {
              _box.deleteAt(index);
              setState(() {});
            },
          ),
        );
      },
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 219, 106, 14),
      onPressed: _displayMyTaskPopup,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  void _displayMyTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 174, 234, 235),
          title: const Text(
            'Add Your New Task!',
            style: TextStyle(color: Colors.black),
          ),
          content: TextField(
            onSubmitted: (_) {
              if (_newContent != null) {
                var task = MyTask(
                  content: _newContent!,
                  timestamp: DateTime.now(),
                  done: false,
                );
                _box.add(task.toMap());
                setState(() {
                  _newContent = null;
                  Navigator.pop(context);
                });
              }
            },
            onChanged: (value) {
              _newContent = value;
            },
          ),
        );
      },
    );
  }
}
