import 'package:daily_task/models/my_task.dart';
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
  Box? _box;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: _deviceHeight * 0.14,
        title: const Text(
          'DAILY TASK',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: _dailyTaskList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _viewTask() {
    return FutureBuilder(
        future: Hive.openBox('myTask'),
        builder: (BuildContext _context, AsyncSnapshot _snapshot) {
          if (_snapshot.connectionState == ConnectionState.done) {
            _box = _snapshot.data;
            return _viewTask();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _dailyTaskList() {
    MyTask newTask =
        MyTask(content: "Eat Gob3", timestamp: DateTime.now(), done: false);
    _box?.add(newTask.toMap());
    return ListView(
      children: [
        ListTile(
          title: const Text(
            'Do Project',
            style: TextStyle(),
          ),
          subtitle: Text(DateTime.now().toString()),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed: _displayMyTaskPopup,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  void _displayMyTaskPopup() {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            title: const Text('Add Your New Task!'),
            content: TextField(
              onSubmitted: (_value) {},
              onChanged: (_value) {
                setState(() {
                  _newContent = _value;
                });
              },
            ),
          );
        });
  }
}
