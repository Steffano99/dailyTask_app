import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight;
  late double _deviceWidth;
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

  Widget _dailyTaskList() {
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
      onPressed: () {},
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
