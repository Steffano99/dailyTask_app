class MyTask {
  String content;
  DateTime timestamp;
  bool done;

  MyTask({required this.content, required this.timestamp, required this.done});

  factory MyTask.fromMap(Map myTask) {
    return MyTask(
        content: myTask["content"],
        timestamp: myTask["timestamp"],
        done: myTask["done"]);
  }

  Map toMap() {
    return {
      "content": content,
      "timestamp": timestamp,
      "done": done,
    };
  }
}
